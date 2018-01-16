(module
  (type $t0 (func (param i32)))
  (type $t1 (func (param i32 i32)))
  (type $t2 (func))
  (import "env" "getAddress" (func $env.getAddress (type $t0)))
  (import "env" "storageStore" (func $env.storageStore (type $t1)))
  (func $main (export "main") (type $t2)
    (local $l0 i32)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l0
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 64))))
    (i64.store align=4
      (i32.add
        (get_local $l0)
        (i32.const 24))
      (i64.const 0))
    (i64.store align=4
      (i32.add
        (get_local $l0)
        (i32.const 16))
      (i64.const 0))
    (i64.store align=4
      (i32.add
        (get_local $l0)
        (i32.const 8))
      (i64.const 0))
    (i64.store align=4
      (get_local $l0)
      (i64.const 0))
    (i64.store align=4
      (i32.add
        (i32.add
          (get_local $l0)
          (i32.const 32))
        (i32.const 24))
      (i64.const 0))
    (i64.store align=4
      (i32.add
        (i32.add
          (get_local $l0)
          (i32.const 32))
        (i32.const 16))
      (i64.const 0))
    (i64.store align=4
      (i32.add
        (i32.add
          (get_local $l0)
          (i32.const 32))
        (i32.const 8))
      (i64.const 0))
    (i64.store offset=32 align=4
      (get_local $l0)
      (i64.const 0))
    (call $env.getAddress
      (get_local $l0))
    (call $env.storageStore
      (i32.add
        (get_local $l0)
        (i32.const 32))
      (get_local $l0))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l0)
        (i32.const 64))))
  (table $T0 0 anyfunc)
  (memory $memory (export "memory") 17)
  (data (i32.const 4) "\10\00\10\00"))
