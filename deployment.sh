# author:zhouhao

function get_current_blg_pid() {
    echo 'deploy start\n'

    port=$1
    pid=$(lsof -i:$port | awk 'NR>1 { print $2}')
    if [[ $pid == "" ]]; then
        echo 'port:'$port' have no process'
        exit
    fi
    
    echo 'port: '$port' -> pid:'$pid''
    return $pid
}

function kill_process_by_pid() {
    if [[ $1 == '' ]]; then
        echo 'port cant be nil'
        exit
    fi

    port=$1
    echo 'kill -9 '$port' '
    $(kill -9 $1)
    
    echo 'nohup hexo s &!'
    $(nohub hexo s &!)

    echo 'deploy success!'

}


## main ##
function main() {
    get_current_blg_pid $1
    kill_process_by_pid $pid
}

port=4000
main $port
