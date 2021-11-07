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
  alias 'sdown'='shutdown -h now'
  alias 'sudo'='command sudo -v; command sudo'
  alias 'gaytrain'='command sl | command lolcat && clear'
  alias 'nmcu'='nodemcu-tool'
  alias 'fishconf'='$EDITOR ~/.config/fish/config.fish'
  alias 'cat'='bat'
  alias 'gs'='git status'
	
	#kitty ssh fix
	if contains "kitty" $TERM
		if not set -q SSH_CLIENT
			alias 'ssh'='kitty +kitten ssh'
		else
			set TERM ansi
		end
	end

end

