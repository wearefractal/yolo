#include <v8.h>
#include <node.h>
#include "node_defs.h"

using namespace v8;
using namespace node;

Handle<Value> identify(const Arguments& args) {
  HandleScope scope;
  ARG_CHECK_OBJECT(0, 'obj');
  Local<Object> obj = Local<Object>::Cast(args[0]);
  return scope.Close(NODE_NUMBER(obj->GetIdentityHash()));
}

Handle<Value> gc(const Arguments& args) {
  HandleScope scope;
  while(!V8::IdleNotification()){};
  return scope.Close(Undefined());
}

Handle<Value> size(const Arguments& args) {
  HandleScope scope;
  return scope.Close(NODE_NUMBER(sizeof(args[0])));
}

Handle<Value> clone(const Arguments& args) {
  HandleScope scope;
  ARG_CHECK_OBJECT(0, 'obj');
  Local<Object> obj = Local<Object>::Cast(args[0]);
  return scope.Close(obj->Clone());
}

void init(Handle<Object> target) {
  HandleScope scope;
  target->Set(NODE_SYMBOL("identify"), FunctionTemplate::New(identify)->GetFunction());
  target->Set(NODE_SYMBOL("gc"), FunctionTemplate::New(gc)->GetFunction());
  target->Set(NODE_SYMBOL("clone"), FunctionTemplate::New(clone)->GetFunction());
  target->Set(NODE_SYMBOL("sizeof"), FunctionTemplate::New(size)->GetFunction());
}

NODE_MODULE(yolo, init)
