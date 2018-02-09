if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

##############################
#
# Update and include $PROFILE_SOURCE bash profile includes
#
##############################

mkdir -p $HOME/bin
chmod 755 $HOME/bin
export PATH=$PATH:$HOME/bin

##############################
#
# Update and include $PROFILE_SOURCE bash profile includes
#
##############################

PROFILE_SOURCE=$HOME/.bash_profile_includes
mkdir -p $PROFILE_SOURCE

if [ -f $PROFILE_SOURCE/.update ]
then
    source $PROFILE_SOURCE/.update
fi

for src in $(find $PROFILE_SOURCE -type f -name '*.sh')
do
    [[ -r $src ]] && source $src
done

