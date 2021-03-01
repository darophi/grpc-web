

$DIR = "$PWD/playground/examples/"
$FILE = "$PWD/playground/examples/echo.proto"
$OUTDIR = "$PWD/playground/out"

$PLUGIN = "$PWD/bazel-bin/javascript/net/grpc/web/protoc-gen-grpc-web.exe"

Write-Host $PLUGIN

bazel build --compilation_mode=opt //javascript/net/grpc/web:protoc-gen-grpc-web

protoc -I="$DIR" "$FILE" --js_out=import_style=commonjs+dts,binary:"$OUTDIR" --grpc-web_out=import_style=typescript,mode=grpcwebtext:"$OUTDIR" --plugin=protoc-gen-grpc-web=$PLUGIN