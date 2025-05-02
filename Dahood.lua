local AcFolder = game:WaitForChild("ReplicatedStorage"):WaitForChild("AC")

for i,v in pairs(AcFolder:GetChildren()) do
    if v:IsA("RemoteFunction") then 
        local _,OnClientInvoke = pcall(getcallbackvalue,v,"OnClientInvoke")

        if _ and OnClientInvoke then 
            local Upvs = getupvalues(OnClientInvoke)[9]

            local Threads = Upvs[22]
            local Timeouts = Upvs[27]

            setreadonly(Threads,false)

            for i,v in pairs(Threads) do 
                coroutine.close(v)
                Threads[i] = nil
            end

            task.defer(function()
                while task.wait(1) do 
                    for i,v in pairs(Timeouts) do 
                        Timeouts[i] = workspace:GetServerTimeNow()
                    end
                end
            end)

            warn("Bypass made by __Index")

            setreadonly(Threads,true)
        end
    end
end
