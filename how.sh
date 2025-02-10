shell_hook() {
  local QUESTION="$BUFFER"
  local SHELL=$(ps -p $$ -o command= | awk '{print $1}')
  local PROMPT="
  You are an experienced Linux engineer with expertise in all Linux 
  commands and their 
  functionality across different Linux systems.

  Given a task, generate a single command or a pipeline 
  of commands that accomplish the task efficiently.
  This command is to be executed in the current shell, $SHELL.
  For complex tasks or those requiring multiple 
  steps, provide a pipeline of commands. 
  Ensure all commands are safe, follow best practices, and are compatible with 
  the system. Make sure that the command flags used are supported by the binaries
  usually available in the current system or shell.
  If a command is not compatible with the 
  system or shell, provide a suitable alternative.

  The system information is: $(uname -a) (generated using: uname -a).
  The user is $USER. Use sudo when necessary

  Create a command to accomplish the following task: $QUESTION

  Output only the command as a single line of plain text, with no 
  quotes, formatting, or additional commentary. Do not use markdown or any 
  other formatting. Do not include the command into a code block.
  Don't include the shell itself (bash, zsh, etc.) in the command.
  "
  model=$(< $HOME/.config/io.datasette.llm/default_model.txt)
  BUFFER="$QUESTION ... $model" 
  zle -R
  local COMMAND=$(llm "$PROMPT" | sed 's/```//g')
  BUFFER="$COMMAND"
  CURSOR=${#BUFFER}
}

zle -N shell_hook

bindkey '^XH' shell_hook
