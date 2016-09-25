function go_install() {
    local GO_VERSION
    # if [[ ! $1 ]]; then
    #     echo "Specify a go VERSION"
    #     return 1
    # fi
    GO_VERSION=${1#v}
    curl -O "https://storage.googleapis.com/golang/${GO_VERSION}.linux-amd64.tar.gz"

    sudo rm -r /usr/local/go

    sudo tar zxvf ${GO_VERSION}.linux-amd64.tar.gz -C /usr/local

    rm ${GO_VERSION}.linux-amd64.tar.gz

}

function go_init_workspace() {
    go get -u -v github.com/nsf/gocode
    go get -u -v sourcegraph.com/sqs/goreturns
    go get -u -v github.com/tpng/gopkgs
    go get -u -v github.com/rogpeppe/godef
    go get -u -v github.com/golang/lint/golint
    go get -u -v github.com/lukehoban/go-outline
    go get -u -v github.com/newhook/go-symbols
    go get -u -v golang.org/x/tools/cmd/guru
    go get -u -v golang.org/x/tools/cmd/gorename
}
