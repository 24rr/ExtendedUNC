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

## Installation
To install the ExtendedUNC library, simply include the provided script in your Roblox project. Once included, the functions will be available as global functions due to the use of a metatable for `_G`.

## Usage
After including the ExtendedUNC script, you can call any of the functions directly. Here are a few examples:

```lua
local modifiedString = findAndReplace("old", "new", "This is the old string.")
print(modifiedString)

local originalTable = { a = 1, b = { c = 2 }}
local clonedTable = tableClone(originalTable)

local areEqual = deepEqual(originalTable, clonedTable)
print(areEqual) -- true

takeScreenshot()

local merged = mergeTables({name = "John", age = 30}, {age = 31, country = "USA"})
print(merged) -- {name = "John", age = 31, country = "USA"}

local flattened = flattenTable({{1, 2}, 3, {4, 5}})
print(table.concat(flattened, ", ")) -- 1, 2, 3, 4, 5

local timestamp = timeToTimestamp(12, 34, 56)
print(timestamp)

local players = serverPlayers(true)
print(table.concat(players, ", "))
```