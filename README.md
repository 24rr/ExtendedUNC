# ExtendedUNC Documentation

## Overview
The ExtendedUNC library provides a collection of utility functions for handling strings, tables, timestamps, and player management in a Roblox game environment. This includes methods for deep comparisons of tables, cloning tables, taking screenshots, merging tables, and more. The functions are designed to facilitate common tasks in a Roblox game development scenario.

## Table of Contents
- [Function Documentation](#function-documentation)
  - [findAndReplace](#findandreplace)
  - [tableClone](#tableclone)
  - [deepEqual](#deepequal)
  - [takeScreenshot](#takescreenshot)
  - [mergeTables](#mergetables)
  - [flattenTable](#flattentable)
  - [timeToTimestamp](#timetotimestamp)
  - [serverPlayers](#serverplayers)
- [Installation](#installation)
- [Usage](#usage)

## Function Documentation

### `findAndReplace(pattern: string, replacement: string, source: string): string`
Replaces all occurrences of a specific pattern in the source string with a replacement string.
- **Parameters**:
  - `pattern`: The string pattern to be searched in the `source`.
  - `replacement`: The string to replace the `pattern` with.
  - `source`: The source string where replacements will take place.
- **Returns**: The modified string with replacements.

### `tableClone(original: table): table`
Creates a deep clone of the given table, including any nested tables.
- **Parameters**:
  - `original`: The table to be cloned.
- **Returns**: A new table which is a deep copy of the `original`.

### `deepEqual(table1: table, table2: table): boolean`
Compares two tables to determine if they are deeply equal.
- **Parameters**:
  - `table1`: The first table to compare.
  - `table2`: The second table to compare.
- **Returns**: `true` if the tables are deeply equal, otherwise `false`.

### `takeScreenshot()`
Captures a screenshot of the current game view and prompts the user to save it to their gallery.
- **Returns**: None
- **Note**: This asynchronous function relies on the `CaptureService` in Roblox.

### `mergeTables(table1: table, table2: table): table`
Merges two tables together. If a key exists in both tables and its value is a table, the tables will be merged recursively.
- **Parameters**:
  - `table1`: The first table to merge.
  - `table2`: The second table to merge.
- **Returns**: A new table that is the result of merging `table1` and `table2`.

### `flattenTable(inputTable: table): table`
Flattens a nested table structure into a single-level table.
- **Parameters**:
  - `inputTable`: The nested table that needs to be flattened.
- **Returns**: A flat table containing all values from the nested input.

### `timeToTimestamp(hours: number, minutes: number, seconds: number): number`
Converts given hours, minutes, and seconds into a Unix timestamp for the current date.
- **Parameters**:
  - `hours`: The hour component of the time.
  - `minutes`: The minute component of the time.
  - `seconds`: The second component of the time.
- **Returns**: A Unix timestamp representing the given time on the current date.

### `serverPlayers(includeLocalPlayer: boolean): {string}`
Retrieves a list of usernames of players currently in the game. Optionally includes the local player.
- **Parameters**:
  - `includeLocalPlayer`: Boolean indicating if the local player should be included in the results.
- **Returns**: A table containing the usernames of players.

### `httpRequest(url: string, method: string, data: table): {string}`
Sends an HTTP request to the specified URL with the given method and optional data.
- **Parameters**:
  - `url`: The URL to which the request is sent.
  - `method`: The HTTP method to use (e.g., "GET", "POST").
  - `data`: An optional table containing data to send with the request, which will be JSON-encoded.
- **Returns**: A decoded JSON response as a table if the request is successful; otherwise, `nil`.

### `simulateKeyPress(key: string, repeatCount: number, delay: number): ()`
Simulates rapid key presses of a specific key on the keyboard at a defined interval.
- **Parameters**:
  - `key`: The name of the key in `Enum.KeyCode` to simulate pressing.
  - `repeatCount`: The number of times to simulate the key press.
  - `delay`: The delay in seconds between key presses.
- **Returns**: None
- **Note**: This function might not have desired effects in all contexts, especially in games with custom control schemes.

### `findAssetInWorkspace(assetName: string): Instance?`
Searches recursively for an asset by name in the Roblox `workspace` and returns it if found.
- **Parameters**:
  - `assetName`: The name of the asset to search for.
- **Returns**: The asset instance if found, otherwise `nil`.

### `debugEnumerateThreads(): {thread}`
Lists all the active threads in the current Lua environment.
- **Returns**: A table containing references to all active threads.

## Installation
To install the ExtendedUNC library, simply include the provided script in your Roblox project. Once included, the functions will be available as global functions due to the use of a metatable for `_G`.