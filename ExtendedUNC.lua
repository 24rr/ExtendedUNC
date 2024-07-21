function findAndReplace(pattern: string, replacement: string, source: string): string
    return source:gsub(pattern, replacement)
end

function tableClone(original: table): table
    local clone = {}
    for k, v in pairs(original) do
        clone[k] = type(v) == "table" and tableClone(v) or v
    end
    return clone
end

function deepEqual(table1: table, table2: table): boolean
    if table1 == table2 then return true end
    if type(table1) ~= "table" or type(table2) ~= "table" then return false end
    for k, v in pairs(table1) do
        if not table2[k] or not deepEqual(v, table2[k]) then return false end
    end
    for k, v in pairs(table2) do
        if not table1[k] then return false end
    end
    return true
end

function takeScreenshot()
    local CaptureService = game:GetService("CaptureService")
    CaptureService:CaptureScreenshot(function(contentId)
        if contentId then
            CaptureService:PromptSaveCapturesToGallery({contentId}, function(success)
                if success then
                    print("Screenshot saved successfully.")
                else
                    print("Screenshot saving was denied.")
                end
            end)
        else
            warn("Failed to capture screenshot.")
        end
    end)
end

function mergeTables(table1: table, table2: table): table
    local merged = tableClone(table1)
    for k, v in pairs(table2) do
        if type(v) == "table" and type(merged[k] or false) == "table" then
            merged[k] = mergeTables(merged[k], v)
        else
            merged[k] = v
        end
    end
    return merged
end

function flattenTable(inputTable: table): table
    local flatTable = {}
    
    local function flatten(subTable)
        for _, value in ipairs(subTable) do
            if type(value) == "table" then
                flatten(value)
            else
                table.insert(flatTable, value)
            end
        end
    end

    flatten(inputTable)
    return flatTable
end

function timeToTimestamp(hours: number, minutes: number, seconds: number): number
    return os.time{year=os.date("%Y"), month=os.date("%m"), day=os.date("%d"), hour=hours, min=minutes, sec=seconds}
end

function serverPlayers(includeLocalPlayer: boolean): {string}
    local usernames = {}
    local players = game:GetService("Players")
    for _, player in ipairs(players:GetPlayers()) do
        if includeLocalPlayer or player ~= players.LocalPlayer then
            table.insert(usernames, player.Name)
        end
    end
    return usernames
end

<<<<<<< HEAD
=======
function httpRequest(url: string, method: string, data: table): {string}
    local HttpService = game:GetService("HttpService")
    local response = HttpService:RequestAsync({
        Url = url,
        Method = method,
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = data and HttpService:JSONEncode(data) or nil
    })
    if response.Success then
        return HttpService:JSONDecode(response.Body)
    else
        warn("HTTP request failed: " .. response.StatusCode .. " " .. response.StatusMessage)
        return nil
    end
end

function simulateKeyPress(key: string, repeatCount: number, delay: number)
    for i = 1, repeatCount do
        game:GetService("UserInputService"):SendKeyEvent(true, Enum.KeyCode[key], false, nil)
        task.wait(delay)
        game:GetService("UserInputService"):SendKeyEvent(false, Enum.KeyCode[key], false, nil)
        task.wait(delay)
    end
end

function findAssetInWorkspace(assetName: string): Instance?
    local function search(instance)
        for _, obj in ipairs(instance:GetDescendants()) do
            if obj.Name == assetName then
                return obj
            end
        end
        return nil
    end
    return search(workspace)
end

function debugEnumerateThreads(): {thread}
    local threads = {}
    for index = 1, math.huge do
        local status, thread = pcall(debug.getinfo, index, "f")
        if status and thread.func then
            table.insert(threads, coroutine.create(thread.func))
        else
            break
        end
    end
    return threads
end

>>>>>>> 72a6134 (new functions)
setmetatable(_G, {
    __index = function(_, key)
        local funcsArray = {
            { -- findAndReplace
                check = function()
                    return key == "findAndReplace"
                end,
                func = findAndReplace
            },
            { -- tableClone
                check = function()
                    return key == "tableClone"
                end,
                func = tableClone
            },
            { -- deepEqual
                check = function()
                    return key == "deepEqual"
                end,
                func = deepEqual
            },
            { -- takeScreenshot
                check = function()
                    return key == "takeScreenshot"
                end,
                func = takeScreenshot
            },
            { -- mergeTables
                check = function()
                    return key == "mergeTables"
                end,
                func = mergeTables
            },
            { -- flattenTable
                check = function()
                    return key == "flattenTable"
                end,
                func = flattenTable
            },
            { -- timeToTimestamp
                check = function()
                    return key == "timeToTimestamp"
                end,
                func = timeToTimestamp
            },
            { -- serverPlayers
                check = function()
                    return key == "serverPlayers"
                end,
                func = serverPlayers
<<<<<<< HEAD
=======
            },
            { -- httpRequest
                check = function()
                    return key == "httpRequest"
                end,
                func = httpRequest
            },
            { -- simulateKeyPress
                check = function()
                    return key == "simulateKeyPress"
                end,
                func = simulateKeyPress
            },
            { -- findAssetInWorkspace
                check = function()
                    return key == "findAssetInWorkspace"
                end,
                func = findAssetInWorkspace
            },
            { -- debugEnumerateThreads
                check = function()
                    return key == "debugEnumerateThreads"
                end,
                func = debugEnumerateThreads
>>>>>>> 72a6134 (new functions)
            }
        }
        -- return the functions only
        for _, func in ipairs(funcsArray) do
            if func.check() then
                return func.func
            end
        end
    end
})

print("ExtendedUNC loaded.")
<<<<<<< HEAD
print("New Functions:" .. table.concat({
=======
print("New Functions: " .. table.concat({
>>>>>>> 72a6134 (new functions)
    "findAndReplace",
    "tableClone",
    "deepEqual",
    "takeScreenshot",
    "mergeTables",
    "flattenTable",
    "timeToTimestamp",
<<<<<<< HEAD
    "serverPlayers"
=======
    "serverPlayers",
    "httpRequest",
    "simulateKeyPress",
    "findAssetInWorkspace",
    "debugEnumerateThreads"
>>>>>>> 72a6134 (new functions)
}, ", "))