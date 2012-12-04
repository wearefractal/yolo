nativ = require '../build/Release/yolo'

sizeof = (val) ->
  return 0 unless val?

  t = typeof val
  return 4 if t is 'boolean'
  return val.length*2 if t is 'string'
  return 8 if t is 'number'

  bytes = nativ.sizeof v
  if Array.isArray v
    bytes += sizeof v for i in val
    return bytes

  if t is 'object'
    bytes += sizeof v for k,v of val
    return bytes

  return bytes # couldnt figure it out

yolo = (o) ->
  delete o[k] for k of o
  nativ.gc()

yolo.gc = nativ.gc
yolo.identify = nativ.identify
yolo.sizeof = sizeof

module.exports = yolo