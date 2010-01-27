require 'java'
require 'OtpErlang.jar'
java_import 'com.ericsson.otp.erlang.OtpConnection'
java_import 'com.ericsson.otp.erlang.OtpErlangObject'
java_import 'com.ericsson.otp.erlang.OtpPeer'
java_import 'com.ericsson.otp.erlang.OtpSelf'
java_import 'com.ericsson.otp.erlang.OtpErlangList'

node        = OtpSelf.new('mynode', File.read(File.expand_path('~/.erlang.cookie')))
rabbit      = OtpPeer.new('rabbit@codeslave')
connection  = node.connect(rabbit)

connection.send_rpc('rabbit', 'status', OtpErlangList.new())
result = connection.receive_rpc

result.each do |item|
  p item.to_s
  p item.class
  puts
end
puts
puts "Element methods:"
p result.first.methods.sort
puts
puts "Elements with classes:"
p result.first.elements.each{|e| puts e.class; p e.to_s}

__END__
codeslave :: ruby/erlix » ruby jerl.rb
"{running_applications,[{rabbit,\"RabbitMQ\",\"1.7.0\"},{mnesia,\"MNESIA  CXC 138 12\",\"4.4.12\"},{os_mon,\"CPO  CXC 138 46\",\"2.2.4\"},{sasl,\"SASL  CXC 138 11\",\"2.1.8\"},{stdlib,\"ERTS  CXC 138 10\",\"1.16.4\"},{kernel,\"ERTS  CXC 138 10\",\"2.13.4\"}]}"
Java::ComEricssonOtpErlang::OtpErlangTuple

"{nodes,[rabbit@codeslave]}"
Java::ComEricssonOtpErlang::OtpErlangTuple

"{running_nodes,[rabbit@codeslave]}"
Java::ComEricssonOtpErlang::OtpErlangTuple


Element methods:
["==", "===", "=~", "__id__", "__jcreate!", "__jsend!", "__send__", "arity", "arity__method", "class", "class__method", "clone", "clone__method", "com", "display", "doHashCode", "doHashCode__method", "do_hash_code", "do_hash_code__method", "dup", "elementAt", "elementAt__method", "element_at", "element_at__method", "elements", "elements__method", "encode", "encode__method", "enum_for", "eql?", "equal?", "equals", "equals?", "equals__method", "equals__method?", "extend", "finalize", "finalize__method", "freeze", "frozen?", "getClass", "getClass__method", "get_class", "get_class__method", "handle_different_imports", "hash", "hashCode", "hashCode__method", "hash_code", "hash_code__method", "id", "include_class", "initialize", "inspect", "instance_eval", "instance_exec", "instance_of?", "instance_variable_defined?", "instance_variable_get", "instance_variable_set", "instance_variables", "is_a?", "java", "java_class", "java_kind_of?", "java_method", "java_object", "java_object=", "java_send", "javax", "kind_of?", "method", "methods", "nil?", "notify", "notifyAll", "notifyAll__method", "notify__method", "notify_all", "notify_all__method", "object_id", "org", "private_methods", "protected_methods", "public_methods", "respond_to?", "send", "singleton_methods", "synchronized", "taint", "tainted?", "tap", "toString", "toString__method", "to_a", "to_enum", "to_java_object", "to_s", "to_string", "to_string__method", "type", "untaint", "wait", "wait__method"]

Elements with classes:
Java::ComEricssonOtpErlang::OtpErlangAtom
"running_applications"
Java::ComEricssonOtpErlang::OtpErlangList
"[{rabbit,\"RabbitMQ\",\"1.7.0\"},{mnesia,\"MNESIA  CXC 138 12\",\"4.4.12\"},{os_mon,\"CPO  CXC 138 46\",\"2.2.4\"},{sasl,\"SASL  CXC 138 11\",\"2.1.8\"},{stdlib,\"ERTS  CXC 138 10\",\"1.16.4\"},{kernel,\"ERTS  CXC 138 10\",\"2.13.4\"}]"
#<#<Class:01x2b68989e>:0x5ffbc355>

