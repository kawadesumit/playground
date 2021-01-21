t = @task begin
    println("task - start")
    for i in 1:10
        print(".")
        sleep(1)
    end
    println("task - end")
end

schedule(t) #control will return immediately after task t is scheduled but does not need to be commpleted
schedule(t);wait(t) #control will return only after task t is commpleted

function producer(c::Channel)
    put!(c, "start")
    for i in 1:10
        put!(c, i)
        sleep(1)
    end
    put!(c, "end")
end

c = Channel(producer)
take!(c)

for i in Channel(producer)
    println(i)
end

# aynch processing example

using Random

const jobs = Channel{Int}(32)
const results = Channel{Tuple}(32)

function worker_old(id::Int)
    for id in jobs
        execTime = rand()
        sleep(execTime)
        put!(results, (id, execTime))
    end
end

function worker(id::Int)
    while true
        execTime = rand()
        sleep(execTime)
        put!(results, (take!(jobs), execTime, id))
    end
end

function createJob(n::Int)
    for i in 1:n
        put!(jobs, i)
    end
end

#start worker process
for i in 1:4
    @async worker(i)
end

@async createJob(12)

@async while true
    local i = 0
    jobId, execTime, workerId = take!(results)
    println("workerId=$workerId $jobId processed in $(round(execTime, digits=2)) time")
end
