This is a fairly significant re-invention of the functionality this is a fork of

Essentially you do (assuming zsh)

    $ source how.sh

Or add it to your `.zshrc`
Then you type your thing at the shell

    $ add a user bob using modern homectl methods  

Then you do (in this example, CTRL+X+H) and it does this

    $ add a user bob using modern homectl methods ... (name of your default model)
    ... a few seconds pass ...
    $ sudo homectl create-user bob
    
Then you can choose to press enter and run it, edit it, ctrl+c, whatever.

This is a much more one-and-done approach but 99% of the time I just forget invocation syntax - I'm not actually exploring things deeply.

