export DISCORDRB_NONACL=true

if [ "$1" = "cont" ]
then
	nohup ruby run.rb > /dev/null &
else
	ruby run.rb
fi


# Note:
# To kick the process, try:
# ps -ef | grep ruby
# and then
# kill <PID>
# (I should automate this probably. Using !stop is fine as it is though.)
