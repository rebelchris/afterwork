# Bash script to check which git projects need commiting
# Define dir
DIR=~/www/
GITBASED=.git
# Step 1 loop through all folders in a dir
for dir in $DIR*
do
    # Check if we have a directory
    if [[ -d $dir ]]; then
        # Change into working directory
        cd $dir
        # Define empty message variable
        MSG="";
        # Check if directory contains .git folder
        if [ -d "$GITBASED" ]; then
            # Define our test for Git Status
            TEST=$(git status $dir);
            # Check if git status is perfect
            if [[ $TEST == *"nothing to commit"* ]]; then
                MSG=": No changes ✅"
            # Check if git status has unstaged changes
            elif [[ $TEST == *"Changes not staged for commit"* ]]; then
                MSG=": Unstaged changes 🤷‍♂️"
            # Check if git status has uncommitted changes
            elif [[ $TEST == *"Untracked files"* ]]; then
                MSG=": You forgot to commit some files 😡"
            fi 
        else 
            # Not a valid git project
            MSG=": Not a valid git project 👀"
        fi
        echo ${dir##*/}$MSG
        cd ..
    fi
done
echo "All done for today! 🔥"