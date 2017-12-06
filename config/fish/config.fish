# Arch 
alias pacman='sudo pacman'
alias pacin='pacman -S'
alias pacre='pacman -R'
alias update='pacman -Syyu ; apacman --auronly --noedit --noconfirm -Syu'
alias pacinfo='pacman -Si'


# Admin
alias chx='chmod u+x'

#Movement
alias cd..='cd ..'
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
alias etemp='mv *.epub $HOME/stuff/ebooks/temp'

#Listing & Grep
alias exa='exa -F'
alias ls='exa -F'
alias la='exa -laFh'
alias ll='exa -lFh'
alias pgrep='pgrep -a'

#editing 
alias n='nvim'
alias vim='nvim'
alias en='nvim $HOME/.config/nvim/init.vim'
alias ei='nvim $HOME/.config/i3/config'
alias ep='nvim $HOME/.config/polybar/config'
alias ef='nvim $HOME/.config/fish/config.fish'
alias es='nvim $HOME/.SpaceVim.d/init.vim'

#Removal
alias rmr='rm *.rar'
alias rmz='rm *.zip'

#Misc
alias bup='sand.py ; wonder.py ; mitchell.py'
alias reloadf='exec fish'
alias ali='cat $HOME/.config/fish/config.fish'
alias scripts='exa -llghR $HOME/stuff/comp/pro/scripts/'
alias icons='sh $HOME/stuff/misc/nerd-fonts-master/bin/scripts/generate-css.sh | grep -nB 2'

##################FUNCTIONS####################

function lc 
  ruby ~/colorls/colorls.rb $1; 
end


function as --description 'output alias, bookmarks, functions, and scripts'
  ali > .as ; echo ' ' >> .as ; scripts >> .as | less .as
end


function extract --description "Expand or extract bundled & compressed files"
  for file in $argv
    if test -f $file
      echo -s "Extracting " (set_color --bold blue) $file (set_color normal)
      switch $file
        case "*.tar"
          tar -xvf $file
        case "*.tar.bz2" "*.tbz2"
          tar --bzip2 -xvf $file
        case "*.tar.gz" "*.tgz"
          tar --gzip -xvf $file
        case "*.bz" "*.bz2"
          bunzip2 $file
        case "*.gz"
          gunzip $file
        case "*.rar"
          unrar x $file
        case "*.zip"
          unzip -uo $file -d (basename $file .zip)
        case "*.Z"
          uncompress $file
        case "*.pax"
          pax -r < $file
        case '*'
          echo "Extension not recognized, cannot extract $file"
      end
    else
      echo "$file is not a valid file"
    end
  end
end



function icon --description "output icons from nerd fonts"
   place=`pwd`
   cd $HOME/stuff/misc/nerd-fonts-master/bin/scripts/
   sh generate-css.sh | grep -nB 2 $argv
   cd $place
end


function release --description "Output number of spacevim releases"
    release.py  | sed -n '3p'
end

function gods --description "Output latest chapter released of GOB"
    gods.py | sed -n '1,3p'
end 

function all --description "bup ,spacevim release number, and GOB chapter"
    bup ; echo " " ; echo "Release" ; release ; echo " " ; echo "Gods" ; gods  
end


################BOOKMARKS######################
# Load fishmarks (http://github.com/techwizrd/fishmarks)
. ~/.fishmarks/marks.fish

#comp_vids            /home/anti-matter/stuff/Videos/comp
#_config              /home/anti-matter/.config
#CT                   /home/anti-matter/Downloads/CT
#Downloads            /home/anti-matter/Downloads
#linux_vids           /home/anti-matter/stuff/Videos/comp/linux
#plants               /home/anti-matter/stuff/Pictures/plants
#pro                  /home/anti-matter/stuff/comp/pro
#py_scripts           /home/anti-matter/stuff/comp/pro/scripts/python
#python               /home/anti-matter/stuff/comp/pro/python
#screen               /home/anti-matter/stuff/Pictures/screenshots
#scripts              /home/anti-matter/stuff/comp/pro/scripts
#temp                 /home/anti-matter/stuff/ebooks/temp
#videos               /home/anti-matter/stuff/Videos
#
#
##############SCRIPTS##############################
#
#
