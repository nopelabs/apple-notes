-- List Notes accounts and folder names with note counts, without note titles.
-- Folder names and counts may themselves be private.
on listFolders(parentObject, indentation)
    set outputText to ""
    tell application "Notes"
        repeat with currentFolder in (folders of parentObject)
            set parentFolder to container of currentFolder
            if (id of parentFolder) is (id of parentObject) then
                set outputText to outputText & indentation & (name of currentFolder as text) & " (" & (count of notes of currentFolder) & ")" & linefeed
                set outputText to outputText & my listFolders(currentFolder, indentation & "  ")
            end if
        end repeat
    end tell
    return outputText
end listFolders

tell application "Notes"
    set outputText to ""
    repeat with currentAccount in accounts
        set outputText to outputText & "Conta: " & (name of currentAccount as text) & linefeed
        set outputText to outputText & my listFolders(currentAccount, "  ")
    end repeat
    return outputText
end tell
