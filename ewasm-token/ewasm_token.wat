(module
  (type $t0 (func (param i32 i32 i32)))
  (type $t1 (func (result i32)))
  (type $t2 (func (param i32 i32)))
  (type $t3 (func))
  (import "ethereum" "callDataCopy" (func $env.callDataCopy (type $t0)))
  (import "ethereum" "getCallDataSize" (func $env.getCallDataSize (type $t1)))
  (import "ethereum" "revert" (func $env.revert (type $t2)))
  (import "ethereum" "storageStore" (func $env.storageStore (type $t2)))
  (table $T0 0 anyfunc)
  (func $main (export "main") (type $t3)
    (local $l0 i32) (local $l1 i32) (local $l2 i32)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l2
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 64))))
    (i32.store offset=4 align=1
      (get_local $l2)
      (i32.const 436376473))
    (i32.store offset=8 align=1
      (get_local $l2)
      (i32.const -1113639587))
    (block $B0
      (br_if $B0
        (i32.gt_u
          (call $env.getCallDataSize)
          (i32.const 3)))
      (i32.store offset=16
        (get_local $l2)
        (i32.const 0))
      (call $env.revert
        (i32.add
          (get_local $l2)
          (i32.const 16))
        (i32.const 0)))
    (i32.store offset=12
      (get_local $l2)
      (i32.const 0))
    (call $env.callDataCopy
      (i32.add
        (get_local $l2)
        (i32.const 12))
      (i32.const 0)
      (i32.const 4))
    (i64.store align=4
      (i32.add
        (get_local $l2)
        (i32.const 40))
      (i64.const 0))
    (i64.store align=4
      (i32.add
        (get_local $l2)
        (i32.const 32))
      (i64.const 0))
    (i64.store align=4
      (i32.add
        (get_local $l2)
        (i32.const 24))
      (i64.const 0))
    (i64.store offset=16 align=4
      (get_local $l2)
      (i64.const 0))
    (i64.store offset=48 align=1
      (get_local $l2)
      (i64.const 144680345659310337))
    (set_local $l1
      (i32.const 93))
    (set_local $l0
      (i32.const 1))
    (block $B1
      (loop $L2
        (br_if $B1
          (i32.ne
            (i32.load8_u
              (i32.add
                (i32.add
                  (i32.add
                    (get_local $l2)
                    (i32.const 12))
                  (get_local $l0))
                (i32.const -1)))
            (i32.and
              (get_local $l1)
              (i32.const 255))))
        (block $B3
          (br_if $B3
            (i32.gt_u
              (get_local $l0)
              (i32.const 3)))
          (set_local $l1
            (i32.load8_u
              (i32.add
                (i32.add
                  (get_local $l2)
                  (i32.const 8))
                (get_local $l0))))
          (set_local $l0
            (i32.add
              (get_local $l0)
              (i32.const 1)))
          (br $L2)))
      (call $env.storageStore
        (i32.add
          (get_local $l2)
          (i32.const 16))
        (i32.add
          (get_local $l2)
          (i32.const 48))))
    (i64.store offset=56 align=1
      (get_local $l2)
      (i64.const 651061555525847048))
    (set_local $l1
      (i32.const 153))
    (set_local $l0
      (i32.const 1))
    (block $B4
      (loop $L5
        (br_if $B4
          (i32.ne
            (i32.load8_u
              (i32.add
                (i32.add
                  (i32.add
                    (get_local $l2)
                    (i32.const 12))
                  (get_local $l0))
                (i32.const -1)))
            (i32.and
              (get_local $l1)
              (i32.const 255))))
        (block $B6
          (br_if $B6
            (i32.gt_u
              (get_local $l0)
              (i32.const 3)))
          (set_local $l1
            (i32.load8_u
              (i32.add
                (i32.add
                  (get_local $l2)
                  (i32.const 4))
                (get_local $l0))))
          (set_local $l0
            (i32.add
              (get_local $l0)
              (i32.const 1)))
          (br $L5)))
      (call $env.storageStore
        (i32.add
          (get_local $l2)
          (i32.const 16))
        (i32.add
          (get_local $l2)
          (i32.const 56))))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l2)
        (i32.const 64))))
  (memory $memory (export "memory") 17)
  (data (i32.const 4) "\10\00\10\00"))
