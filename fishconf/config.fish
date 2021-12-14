#ENVIRONMENT VARIABLES
set EDITOR nvim

if status is-interactive
	# vim all the way
	fish_vi_key_bindings

	# Commands to run in interactive sessions can go here
	if command -v starship &> /dev/null && not contains "linux" $TERM
		starship init fish | source
	end

	if command -v thefuck &> /dev/null
		thefuck --alias | source
	end

	# aliases
	alias 'sdown'='systemctl poweroff'
	alias 'nmcu'='nodemcu-tool'
	alias 'fishconf'='$EDITOR ~/.config/fish/config.fish'
	alias 'cat'='bat'
	alias 'gs'='git status'
	alias 'ls'='command ls -h'
	alias 'll'='ls -l'
	alias 'la'='ls -Al'
	alias 'lsblk'='command lsblk -f'
	alias ':q'='exit' # done that way to often
	function rm # never rm -rf $HOME again...
		command rm -iv $argv
	end
	
	#kitty ssh fix
	if [ $TERM = 'xterm-kitty' ]
			alias 'ssh'='kitty +kitten ssh'
	end

	if command -v tutel &> /dev/null 
		tutel nav init fish | source
	end

	#man with color
	if command -v batman &> /dev/null 
		alias 'man'='batman'
	end

	# doas exists
	if not command -v doas &> /dev/null
		alias 'sudo'='command sudo -v; command sudo'
	end	

	#Disable Greeting
	set fish_greeting
end

