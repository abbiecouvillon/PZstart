rcon -a %1 -p %2 "servermsg \"Server is saving.\""
rcon -a %1 -p %2 "save"
rcon -a %1 -p %2 "servermsg \"Server save complete.\""

exit