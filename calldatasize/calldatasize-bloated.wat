(module
  (type $t0 (func (result i32)))
  (type $t1 (func (param i32 i32)))
  (type $t2 (func))
  (type $t3 (func (param i32 i32 i32) (result i32)))
  (type $t4 (func (param f32 f32) (result f32)))
  (type $t5 (func (param f64 f64) (result f64)))
  (type $t6 (func (param i32 i32) (result i32)))
  (type $t7 (func (param i64 i64) (result i64)))
  (type $t8 (func (param i64 i64 i32) (result i64)))
  (type $t9 (func (param i32 i64 i64 i64 i64)))
  (type $t10 (func (param i32 i64 i64 i64 i64 i32)))
  (type $t11 (func (param f32 i32) (result f32)))
  (type $t12 (func (param f64 i32) (result f64)))
  (type $t13 (func (param i64 i32) (result i64)))
  (type $t14 (func (param i32 i64 i64 i32)))
  (type $t15 (func (param i32) (result f32)))
  (type $t16 (func (param i32) (result f64)))
  (type $t17 (func (param i64) (result f64)))
  (type $t18 (func (param i64 i64) (result f32)))
  (type $t19 (func (param i64 i64) (result f64)))
  (type $t20 (func (param f32) (result i32)))
  (type $t21 (func (param f32) (result i64)))
  (type $t22 (func (param i32 f32)))
  (type $t23 (func (param f64) (result i32)))
  (type $t24 (func (param f64) (result i64)))
  (type $t25 (func (param i32 f64)))
  (import "env" "getCallDataSize" (func $env.getCallDataSize (type $t0)))
  (import "env" "storageStore" (func $env.storageStore (type $t1)))
  (func $main (export "main") (type $t2)
    (local $l0 i32)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l0
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 48))))
    (i32.store offset=12
      (get_local $l0)
      (call $env.getCallDataSize))
    (i64.store align=4
      (i32.add
        (get_local $l0)
        (i32.const 40))
      (i64.const 0))
    (i64.store align=4
      (i32.add
        (get_local $l0)
        (i32.const 32))
      (i64.const 0))
    (i64.store align=4
      (i32.add
        (get_local $l0)
        (i32.const 24))
      (i64.const 0))
    (i64.store offset=16 align=4
      (get_local $l0)
      (i64.const 0))
    (call $env.storageStore
      (i32.add
        (get_local $l0)
        (i32.const 16))
      (i32.add
        (get_local $l0)
        (i32.const 12)))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l0)
        (i32.const 48))))
  (func $rust_eh_personality (export "rust_eh_personality") (type $t2))
  (func $memcpy (export "memcpy") (type $t3) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l0 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (get_local $p2)))
      (set_local $l0
        (get_local $p0))
      (loop $L1
        (i32.store8
          (get_local $l0)
          (i32.load8_u
            (get_local $p1)))
        (set_local $p1
          (i32.add
            (get_local $p1)
            (i32.const 1)))
        (set_local $l0
          (i32.add
            (get_local $l0)
            (i32.const 1)))
        (br_if $L1
          (tee_local $p2
            (i32.add
              (get_local $p2)
              (i32.const -1))))))
    (get_local $p0))
  (func $memmove (export "memmove") (type $t3) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l0 i32)
    (block $B0
      (block $B1
        (br_if $B1
          (i32.ge_u
            (get_local $p1)
            (get_local $p0)))
        (br_if $B0
          (i32.eqz
            (get_local $p2)))
        (loop $L2
          (i32.store8
            (i32.add
              (i32.add
                (get_local $p0)
                (get_local $p2))
              (i32.const -1))
            (i32.load8_u
              (i32.add
                (i32.add
                  (get_local $p1)
                  (get_local $p2))
                (i32.const -1))))
          (br_if $L2
            (tee_local $p2
              (i32.add
                (get_local $p2)
                (i32.const -1))))
          (br $B0))
        (unreachable))
      (br_if $B0
        (i32.eqz
          (get_local $p2)))
      (set_local $l0
        (get_local $p0))
      (loop $L3
        (i32.store8
          (get_local $l0)
          (i32.load8_u
            (get_local $p1)))
        (set_local $p1
          (i32.add
            (get_local $p1)
            (i32.const 1)))
        (set_local $l0
          (i32.add
            (get_local $l0)
            (i32.const 1)))
        (br_if $L3
          (tee_local $p2
            (i32.add
              (get_local $p2)
              (i32.const -1))))))
    (get_local $p0))
  (func $memset (export "memset") (type $t3) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l0 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (get_local $p2)))
      (set_local $l0
        (get_local $p0))
      (loop $L1
        (i32.store8
          (get_local $l0)
          (get_local $p1))
        (set_local $l0
          (i32.add
            (get_local $l0)
            (i32.const 1)))
        (br_if $L1
          (tee_local $p2
            (i32.add
              (get_local $p2)
              (i32.const -1))))))
    (get_local $p0))
  (func $memcmp (export "memcmp") (type $t3) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32)
    (block $B0
      (block $B1
        (br_if $B1
          (i32.eqz
            (get_local $p2)))
        (set_local $l2
          (i32.const 0))
        (loop $L2
          (br_if $B0
            (i32.ne
              (tee_local $l0
                (i32.load8_u
                  (i32.add
                    (get_local $p0)
                    (get_local $l2))))
              (tee_local $l1
                (i32.load8_u
                  (i32.add
                    (get_local $p1)
                    (get_local $l2))))))
          (br_if $L2
            (i32.lt_u
              (tee_local $l2
                (i32.add
                  (get_local $l2)
                  (i32.const 1)))
              (get_local $p2))))
        (return
          (i32.const 0)))
      (return
        (i32.const 0)))
    (i32.sub
      (get_local $l0)
      (get_local $l1)))
  (func $__subsf3 (export "__subsf3") (type $t4) (param $p0 f32) (param $p1 f32) (result f32)
    (f32.add
      (f32.reinterpret/i32
        (i32.xor
          (i32.reinterpret/f32
            (get_local $p1))
          (i32.const -2147483648)))
      (get_local $p0)))
  (func $__subdf3 (export "__subdf3") (type $t5) (param $p0 f64) (param $p1 f64) (result f64)
    (f64.add
      (f64.reinterpret/i64
        (i64.xor
          (i64.reinterpret/f64
            (get_local $p1))
          (i64.const -9223372036854775808)))
      (get_local $p0)))
  (func $__udivsi3 (export "__udivsi3") (type $t6) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (get_local $p1)))
      (set_local $l3
        (i32.const 0))
      (block $B1
        (br_if $B1
          (i32.eqz
            (get_local $p0)))
        (br_if $B1
          (i32.ge_u
            (tee_local $l2
              (i32.sub
                (i32.clz
                  (get_local $p1))
                (i32.clz
                  (get_local $p0))))
            (i32.const 32)))
        (block $B2
          (br_if $B2
            (i32.ne
              (get_local $l2)
              (i32.const 31)))
          (return
            (get_local $p0)))
        (set_local $l3
          (i32.shl
            (get_local $p0)
            (i32.and
              (i32.sub
                (i32.const 31)
                (get_local $l2))
              (i32.const 31))))
        (block $B3
          (block $B4
            (br_if $B4
              (i32.eqz
                (tee_local $l2
                  (i32.add
                    (get_local $l2)
                    (i32.const 1)))))
            (set_local $l0
              (i32.add
                (get_local $p1)
                (i32.const -1)))
            (set_local $p0
              (i32.shr_u
                (get_local $p0)
                (i32.and
                  (get_local $l2)
                  (i32.const 31))))
            (set_local $l4
              (i32.const 0))
            (loop $L5
              (set_local $p0
                (i32.sub
                  (tee_local $p0
                    (i32.or
                      (i32.shr_u
                        (get_local $l3)
                        (i32.const 31))
                      (i32.shl
                        (get_local $p0)
                        (i32.const 1))))
                  (i32.and
                    (tee_local $l1
                      (i32.shr_s
                        (i32.sub
                          (get_local $l0)
                          (get_local $p0))
                        (i32.const 31)))
                    (get_local $p1))))
              (set_local $l3
                (i32.or
                  (i32.shl
                    (get_local $l3)
                    (i32.const 1))
                  (get_local $l4)))
              (set_local $l4
                (tee_local $l1
                  (i32.and
                    (get_local $l1)
                    (i32.const 1))))
              (br_if $L5
                (tee_local $l2
                  (i32.add
                    (get_local $l2)
                    (i32.const -1))))
              (br $B3))
            (unreachable))
          (set_local $l1
            (i32.const 0)))
        (set_local $l3
          (i32.or
            (i32.shl
              (get_local $l3)
              (i32.const 1))
            (get_local $l1))))
      (return
        (get_local $l3)))
    (unreachable)
    (unreachable))
  (func $__umodsi3 (export "__umodsi3") (type $t6) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (get_local $p1)))
      (set_local $l3
        (i32.const 0))
      (block $B1
        (br_if $B1
          (i32.eqz
            (get_local $p0)))
        (br_if $B1
          (i32.gt_u
            (tee_local $l2
              (i32.sub
                (i32.clz
                  (get_local $p1))
                (i32.clz
                  (get_local $p0))))
            (i32.const 31)))
        (set_local $l3
          (get_local $p0))
        (br_if $B1
          (i32.eq
            (get_local $l2)
            (i32.const 31)))
        (set_local $l3
          (i32.shl
            (get_local $p0)
            (i32.and
              (i32.sub
                (i32.const 31)
                (get_local $l2))
              (i32.const 31))))
        (block $B2
          (block $B3
            (br_if $B3
              (i32.eqz
                (tee_local $l2
                  (i32.add
                    (get_local $l2)
                    (i32.const 1)))))
            (set_local $l0
              (i32.add
                (get_local $p1)
                (i32.const -1)))
            (set_local $l4
              (i32.shr_u
                (get_local $p0)
                (i32.and
                  (get_local $l2)
                  (i32.const 31))))
            (set_local $l5
              (i32.const 0))
            (loop $L4
              (set_local $l4
                (i32.sub
                  (tee_local $l4
                    (i32.or
                      (i32.shl
                        (get_local $l4)
                        (i32.const 1))
                      (i32.shr_u
                        (get_local $l3)
                        (i32.const 31))))
                  (i32.and
                    (tee_local $l1
                      (i32.shr_s
                        (i32.sub
                          (get_local $l0)
                          (get_local $l4))
                        (i32.const 31)))
                    (get_local $p1))))
              (set_local $l3
                (i32.or
                  (get_local $l5)
                  (i32.shl
                    (get_local $l3)
                    (i32.const 1))))
              (set_local $l5
                (tee_local $l1
                  (i32.and
                    (get_local $l1)
                    (i32.const 1))))
              (br_if $L4
                (tee_local $l2
                  (i32.add
                    (get_local $l2)
                    (i32.const -1))))
              (br $B2))
            (unreachable))
          (set_local $l1
            (i32.const 0)))
        (set_local $l3
          (i32.or
            (i32.shl
              (get_local $l3)
              (i32.const 1))
            (get_local $l1))))
      (return
        (i32.sub
          (get_local $p0)
          (i32.mul
            (get_local $l3)
            (get_local $p1)))))
    (unreachable)
    (unreachable))
  (func $__udivmodsi4 (export "__udivmodsi4") (type $t3) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (get_local $p1)))
      (set_local $l3
        (i32.const 0))
      (block $B1
        (br_if $B1
          (i32.eqz
            (get_local $p0)))
        (br_if $B1
          (i32.gt_u
            (tee_local $l2
              (i32.sub
                (i32.clz
                  (get_local $p1))
                (i32.clz
                  (get_local $p0))))
            (i32.const 31)))
        (set_local $l3
          (get_local $p0))
        (br_if $B1
          (i32.eq
            (get_local $l2)
            (i32.const 31)))
        (set_local $l3
          (i32.shl
            (get_local $p0)
            (i32.and
              (i32.sub
                (i32.const 31)
                (get_local $l2))
              (i32.const 31))))
        (block $B2
          (block $B3
            (br_if $B3
              (i32.eqz
                (tee_local $l2
                  (i32.add
                    (get_local $l2)
                    (i32.const 1)))))
            (set_local $l0
              (i32.add
                (get_local $p1)
                (i32.const -1)))
            (set_local $l4
              (i32.shr_u
                (get_local $p0)
                (i32.and
                  (get_local $l2)
                  (i32.const 31))))
            (set_local $l5
              (i32.const 0))
            (loop $L4
              (set_local $l4
                (i32.sub
                  (tee_local $l4
                    (i32.or
                      (i32.shl
                        (get_local $l4)
                        (i32.const 1))
                      (i32.shr_u
                        (get_local $l3)
                        (i32.const 31))))
                  (i32.and
                    (tee_local $l1
                      (i32.shr_s
                        (i32.sub
                          (get_local $l0)
                          (get_local $l4))
                        (i32.const 31)))
                    (get_local $p1))))
              (set_local $l3
                (i32.or
                  (get_local $l5)
                  (i32.shl
                    (get_local $l3)
                    (i32.const 1))))
              (set_local $l5
                (tee_local $l1
                  (i32.and
                    (get_local $l1)
                    (i32.const 1))))
              (br_if $L4
                (tee_local $l2
                  (i32.add
                    (get_local $l2)
                    (i32.const -1))))
              (br $B2))
            (unreachable))
          (set_local $l1
            (i32.const 0)))
        (set_local $l3
          (i32.or
            (i32.shl
              (get_local $l3)
              (i32.const 1))
            (get_local $l1))))
      (block $B5
        (br_if $B5
          (i32.eqz
            (get_local $p2)))
        (i32.store
          (get_local $p2)
          (i32.sub
            (get_local $p0)
            (i32.mul
              (get_local $l3)
              (get_local $p1)))))
      (return
        (get_local $l3)))
    (unreachable)
    (unreachable))
  (func $__udivdi3 (export "__udivdi3") (type $t7) (param $p0 i64) (param $p1 i64) (result i64)
    (call $__udivmoddi4
      (get_local $p0)
      (get_local $p1)
      (i32.const 0)))
  (func $__udivmoddi4 (export "__udivmoddi4") (type $t8) (param $p0 i64) (param $p1 i64) (param $p2 i32) (result i64)
    (local $l0 i32) (local $l1 i32) (local $l2 i64) (local $l3 i64) (local $l4 i64) (local $l5 i64)
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (block $B4
              (block $B5
                (block $B6
                  (block $B7
                    (block $B8
                      (block $B9
                        (block $B10
                          (block $B11
                            (block $B12
                              (block $B13
                                (block $B14
                                  (block $B15
                                    (br_if $B15
                                      (i64.gt_u
                                        (get_local $p0)
                                        (i64.const 4294967295)))
                                    (br_if $B14
                                      (i64.ge_u
                                        (get_local $p1)
                                        (i64.const 4294967296)))
                                    (set_local $l0
                                      (i32.wrap/i64
                                        (get_local $p1)))
                                    (br_if $B11
                                      (i32.eqz
                                        (get_local $p2)))
                                    (br_if $B2
                                      (i32.eqz
                                        (get_local $l0)))
                                    (i64.store
                                      (get_local $p2)
                                      (i64.extend_u/i32
                                        (i32.rem_u
                                          (i32.wrap/i64
                                            (get_local $p0))
                                          (get_local $l0))))
                                    (br $B10))
                                  (br_if $B13
                                    (i32.eqz
                                      (tee_local $l0
                                        (i32.wrap/i64
                                          (get_local $p1)))))
                                  (br_if $B12
                                    (i64.ge_u
                                      (get_local $p1)
                                      (i64.const 4294967296)))
                                  (br_if $B7
                                    (i32.eqz
                                      (i32.and
                                        (i32.add
                                          (get_local $l0)
                                          (i32.const -1))
                                        (get_local $l0))))
                                  (set_local $l1
                                    (i32.sub
                                      (i32.const 0)
                                      (tee_local $l0
                                        (i32.sub
                                          (i32.add
                                            (i32.clz
                                              (get_local $l0))
                                            (i32.const 33))
                                          (i32.clz
                                            (i32.wrap/i64
                                              (i64.shr_u
                                                (get_local $p0)
                                                (i64.const 32))))))))
                                  (br $B3))
                                (set_local $l5
                                  (i64.const 0))
                                (br_if $B0
                                  (i32.eqz
                                    (get_local $p2)))
                                (i64.store
                                  (get_local $p2)
                                  (get_local $p0))
                                (return
                                  (i64.const 0)))
                              (br_if $B2
                                (i64.lt_u
                                  (get_local $p1)
                                  (i64.const 4294967296)))
                              (br_if $B8
                                (i32.eqz
                                  (i32.wrap/i64
                                    (get_local $p0))))
                              (br_if $B6
                                (i32.eqz
                                  (tee_local $l0
                                    (i32.wrap/i64
                                      (i64.shr_u
                                        (get_local $p1)
                                        (i64.const 32))))))
                              (br_if $B6
                                (i32.and
                                  (i32.add
                                    (get_local $l0)
                                    (i32.const -1))
                                  (get_local $l0)))
                              (block $B16
                                (br_if $B16
                                  (i32.eqz
                                    (get_local $p2)))
                                (i64.store
                                  (get_local $p2)
                                  (i64.and
                                    (i64.or
                                      (i64.add
                                        (get_local $p1)
                                        (i64.const -4294967296))
                                      (i64.const 4294967295))
                                    (get_local $p0))))
                              (return
                                (i64.extend_u/i32
                                  (i32.shr_u
                                    (i32.wrap/i64
                                      (i64.shr_u
                                        (get_local $p0)
                                        (i64.const 32)))
                                    (i32.and
                                      (i32.ctz
                                        (get_local $l0))
                                      (i32.const 31))))))
                            (br_if $B9
                              (i32.le_u
                                (tee_local $l0
                                  (i32.sub
                                    (i32.clz
                                      (i32.wrap/i64
                                        (i64.shr_u
                                          (get_local $p1)
                                          (i64.const 32))))
                                    (i32.clz
                                      (i32.wrap/i64
                                        (i64.shr_u
                                          (get_local $p0)
                                          (i64.const 32))))))
                                (i32.const 31)))
                            (set_local $l5
                              (i64.const 0))
                            (br_if $B0
                              (i32.eqz
                                (get_local $p2)))
                            (i64.store
                              (get_local $p2)
                              (get_local $p0))
                            (return
                              (i64.const 0)))
                          (br_if $B1
                            (i32.eqz
                              (get_local $l0))))
                        (set_local $l5
                          (i64.extend_u/i32
                            (i32.div_u
                              (i32.wrap/i64
                                (get_local $p0))
                              (get_local $l0))))
                        (br $B0))
                      (set_local $l1
                        (i32.sub
                          (i32.const 63)
                          (get_local $l0)))
                      (set_local $l0
                        (i32.add
                          (get_local $l0)
                          (i32.const 1)))
                      (br $B3))
                    (set_local $l0
                      (i32.wrap/i64
                        (i64.shr_u
                          (get_local $p1)
                          (i64.const 32))))
                    (block $B17
                      (br_if $B17
                        (i32.eqz
                          (get_local $p2)))
                      (i64.store
                        (get_local $p2)
                        (i64.shl
                          (i64.extend_u/i32
                            (i32.rem_u
                              (i32.wrap/i64
                                (i64.shr_u
                                  (get_local $p0)
                                  (i64.const 32)))
                              (get_local $l0)))
                          (i64.const 32))))
                    (return
                      (i64.extend_u/i32
                        (i32.div_u
                          (i32.wrap/i64
                            (i64.shr_u
                              (get_local $p0)
                              (i64.const 32)))
                          (get_local $l0)))))
                  (block $B18
                    (br_if $B18
                      (i32.eqz
                        (get_local $p2)))
                    (i64.store
                      (get_local $p2)
                      (i64.and
                        (i64.and
                          (i64.add
                            (get_local $p1)
                            (i64.const 4294967295))
                          (get_local $p0))
                        (i64.const 4294967295))))
                  (br_if $B5
                    (i32.ne
                      (get_local $l0)
                      (i32.const 1)))
                  (return
                    (get_local $p0)))
                (br_if $B4
                  (i32.le_u
                    (tee_local $l0
                      (i32.sub
                        (i32.clz
                          (get_local $l0))
                        (i32.clz
                          (i32.wrap/i64
                            (i64.shr_u
                              (get_local $p0)
                              (i64.const 32))))))
                    (i32.const 30)))
                (set_local $l5
                  (i64.const 0))
                (br_if $B0
                  (i32.eqz
                    (get_local $p2)))
                (i64.store
                  (get_local $p2)
                  (get_local $p0))
                (return
                  (i64.const 0)))
              (return
                (i64.shr_u
                  (get_local $p0)
                  (i64.extend_u/i32
                    (i32.ctz
                      (get_local $l0))))))
            (set_local $l1
              (i32.sub
                (i32.const 63)
                (get_local $l0)))
            (set_local $l0
              (i32.add
                (get_local $l0)
                (i32.const 1))))
          (set_local $l5
            (i64.shl
              (get_local $p0)
              (i64.extend_u/i32
                (i32.and
                  (get_local $l1)
                  (i32.const 63)))))
          (set_local $p0
            (i64.shr_u
              (get_local $p0)
              (i64.extend_u/i32
                (i32.and
                  (get_local $l0)
                  (i32.const 63)))))
          (block $B19
            (block $B20
              (br_if $B20
                (i32.eqz
                  (get_local $l0)))
              (set_local $l2
                (i64.add
                  (get_local $p1)
                  (i64.const -1)))
              (set_local $l4
                (i64.const 0))
              (loop $L21
                (set_local $p0
                  (i64.sub
                    (tee_local $p0
                      (i64.or
                        (i64.shl
                          (get_local $p0)
                          (i64.const 1))
                        (i64.shr_u
                          (get_local $l5)
                          (i64.const 63))))
                    (i64.and
                      (tee_local $l3
                        (i64.shr_s
                          (i64.sub
                            (get_local $l2)
                            (get_local $p0))
                          (i64.const 63)))
                      (get_local $p1))))
                (set_local $l5
                  (i64.or
                    (get_local $l4)
                    (i64.shl
                      (get_local $l5)
                      (i64.const 1))))
                (set_local $l4
                  (tee_local $l3
                    (i64.and
                      (get_local $l3)
                      (i64.const 1))))
                (br_if $L21
                  (tee_local $l0
                    (i32.add
                      (get_local $l0)
                      (i32.const -1))))
                (br $B19))
              (unreachable))
            (set_local $l3
              (i64.const 0)))
          (block $B22
            (br_if $B22
              (i32.eqz
                (get_local $p2)))
            (i64.store
              (get_local $p2)
              (get_local $p0)))
          (return
            (i64.or
              (get_local $l3)
              (i64.shl
                (get_local $l5)
                (i64.const 1)))))
        (unreachable)
        (unreachable))
      (unreachable)
      (unreachable))
    (get_local $l5))
  (func $__umoddi3 (export "__umoddi3") (type $t7) (param $p0 i64) (param $p1 i64) (result i64)
    (local $l0 i32)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l0
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 16))))
    (i64.store offset=8
      (get_local $l0)
      (i64.const 0))
    (drop
      (call $__udivmoddi4
        (get_local $p0)
        (get_local $p1)
        (i32.add
          (get_local $l0)
          (i32.const 8))))
    (set_local $p0
      (i64.load offset=8
        (get_local $l0)))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l0)
        (i32.const 16)))
    (get_local $p0))
  (func $__udivti3 (export "__udivti3") (type $t9) (param $p0 i32) (param $p1 i64) (param $p2 i64) (param $p3 i64) (param $p4 i64)
    (local $l0 i32)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l0
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 16))))
    (call $__udivmodti4
      (get_local $l0)
      (get_local $p1)
      (get_local $p2)
      (get_local $p3)
      (get_local $p4)
      (i32.const 0))
    (set_local $p1
      (i64.load
        (get_local $l0)))
    (i64.store
      (i32.add
        (get_local $p0)
        (i32.const 8))
      (i64.load
        (i32.add
          (get_local $l0)
          (i32.const 8))))
    (i64.store
      (get_local $p0)
      (get_local $p1))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l0)
        (i32.const 16))))
  (func $__udivmodti4 (export "__udivmodti4") (type $t10) (param $p0 i32) (param $p1 i64) (param $p2 i64) (param $p3 i64) (param $p4 i64) (param $p5 i32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i64) (local $l4 i64) (local $l5 i64) (local $l6 i64) (local $l7 i64) (local $l8 i64) (local $l9 i64) (local $l10 i64)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l2
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 48))))
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (block $B4
              (block $B5
                (block $B6
                  (block $B7
                    (block $B8
                      (block $B9
                        (block $B10
                          (block $B11
                            (block $B12
                              (block $B13
                                (block $B14
                                  (block $B15
                                    (block $B16
                                      (br_if $B16
                                        (i64.ne
                                          (get_local $p2)
                                          (i64.const 0)))
                                      (br_if $B15
                                        (i32.eqz
                                          (i64.eqz
                                            (get_local $p4))))
                                      (br_if $B12
                                        (i32.eqz
                                          (get_local $p5)))
                                      (br_if $B1
                                        (i64.eq
                                          (get_local $p3)
                                          (i64.const 0)))
                                      (i64.store
                                        (i32.add
                                          (get_local $p5)
                                          (i32.const 8))
                                        (i64.const 0))
                                      (i64.store
                                        (get_local $p5)
                                        (i64.rem_u
                                          (get_local $p1)
                                          (get_local $p3)))
                                      (br $B11))
                                    (br_if $B14
                                      (i64.eqz
                                        (get_local $p3)))
                                    (br_if $B13
                                      (i32.eqz
                                        (i64.eqz
                                          (get_local $p4))))
                                    (br_if $B8
                                      (i64.eqz
                                        (i64.and
                                          (tee_local $l7
                                            (i64.add
                                              (get_local $p3)
                                              (i64.const -1)))
                                          (get_local $p3))))
                                    (set_local $l1
                                      (i32.sub
                                        (i32.const 0)
                                        (tee_local $l0
                                          (i32.sub
                                            (i32.add
                                              (i32.wrap/i64
                                                (i64.clz
                                                  (get_local $p3)))
                                              (i32.const 65))
                                            (i32.wrap/i64
                                              (i64.clz
                                                (get_local $p2)))))))
                                    (br $B3))
                                  (br_if $B6
                                    (i32.eqz
                                      (get_local $p5)))
                                  (i64.store
                                    (get_local $p5)
                                    (get_local $p1))
                                  (i64.store
                                    (i32.add
                                      (get_local $p5)
                                      (i32.const 8))
                                    (get_local $p2))
                                  (br $B6))
                                (br_if $B1
                                  (tee_local $l0
                                    (i64.eqz
                                      (get_local $p4))))
                                (br_if $B9
                                  (i64.eq
                                    (get_local $p1)
                                    (i64.const 0)))
                                (br_if $B7
                                  (get_local $l0))
                                (br_if $B7
                                  (i32.eqz
                                    (i64.eqz
                                      (i64.and
                                        (tee_local $l7
                                          (i64.add
                                            (get_local $p4)
                                            (i64.const -1)))
                                        (get_local $p4)))))
                                (block $B17
                                  (br_if $B17
                                    (i32.eqz
                                      (get_local $p5)))
                                  (i64.store
                                    (get_local $p5)
                                    (get_local $p1))
                                  (i64.store
                                    (i32.add
                                      (get_local $p5)
                                      (i32.const 8))
                                    (i64.and
                                      (get_local $l7)
                                      (get_local $p2))))
                                (set_local $p1
                                  (i64.shr_u
                                    (get_local $p2)
                                    (i64.and
                                      (i64.ctz
                                        (get_local $p4))
                                      (i64.const 63))))
                                (br $B5))
                              (br_if $B10
                                (i32.le_u
                                  (tee_local $l0
                                    (i32.sub
                                      (i32.wrap/i64
                                        (i64.clz
                                          (get_local $p4)))
                                      (i32.wrap/i64
                                        (i64.clz
                                          (get_local $p2)))))
                                  (i32.const 63)))
                              (br_if $B6
                                (i32.eqz
                                  (get_local $p5)))
                              (i64.store
                                (get_local $p5)
                                (get_local $p1))
                              (i64.store
                                (i32.add
                                  (get_local $p5)
                                  (i32.const 8))
                                (get_local $p2))
                              (br $B6))
                            (br_if $B0
                              (i64.eq
                                (get_local $p3)
                                (i64.const 0))))
                          (set_local $p1
                            (i64.div_u
                              (get_local $p1)
                              (get_local $p3)))
                          (br $B5))
                        (set_local $l1
                          (i32.sub
                            (i32.const 127)
                            (get_local $l0)))
                        (set_local $l0
                          (i32.add
                            (get_local $l0)
                            (i32.const 1)))
                        (br $B3))
                      (block $B18
                        (br_if $B18
                          (i32.eqz
                            (get_local $p5)))
                        (i64.store
                          (get_local $p5)
                          (i64.const 0))
                        (i64.store
                          (i32.add
                            (get_local $p5)
                            (i32.const 8))
                          (i64.rem_u
                            (get_local $p2)
                            (get_local $p4))))
                      (set_local $p1
                        (i64.div_u
                          (get_local $p2)
                          (get_local $p4)))
                      (br $B5))
                    (block $B19
                      (br_if $B19
                        (i32.eqz
                          (get_local $p5)))
                      (i64.store
                        (i32.add
                          (get_local $p5)
                          (i32.const 8))
                        (i64.const 0))
                      (i64.store
                        (get_local $p5)
                        (i64.and
                          (get_local $l7)
                          (get_local $p1))))
                    (br_if $B2
                      (i64.eq
                        (get_local $p3)
                        (i64.const 1)))
                    (call $__lshrti3
                      (i32.add
                        (get_local $l2)
                        (i32.const 32))
                      (get_local $p1)
                      (get_local $p2)
                      (i32.wrap/i64
                        (i64.ctz
                          (get_local $p3))))
                    (set_local $p2
                      (i64.load
                        (i32.add
                          (get_local $l2)
                          (i32.const 40))))
                    (set_local $p1
                      (i64.load offset=32
                        (get_local $l2)))
                    (br $B2))
                  (br_if $B4
                    (i32.le_u
                      (tee_local $l0
                        (i32.sub
                          (i32.wrap/i64
                            (i64.clz
                              (get_local $p4)))
                          (i32.wrap/i64
                            (i64.clz
                              (get_local $p2)))))
                      (i32.const 62)))
                  (br_if $B6
                    (i32.eqz
                      (get_local $p5)))
                  (i64.store
                    (get_local $p5)
                    (get_local $p1))
                  (i64.store
                    (i32.add
                      (get_local $p5)
                      (i32.const 8))
                    (get_local $p2)))
                (set_local $p1
                  (i64.const 0)))
              (set_local $p2
                (i64.const 0))
              (br $B2))
            (set_local $l1
              (i32.sub
                (i32.const 127)
                (get_local $l0)))
            (set_local $l0
              (i32.add
                (get_local $l0)
                (i32.const 1))))
          (call $__ashlti3
            (get_local $l2)
            (get_local $p1)
            (get_local $p2)
            (i32.and
              (get_local $l1)
              (i32.const 127)))
          (call $__lshrti3
            (i32.add
              (get_local $l2)
              (i32.const 16))
            (get_local $p1)
            (get_local $p2)
            (i32.and
              (get_local $l0)
              (i32.const 127)))
          (set_local $p2
            (i64.load
              (i32.add
                (get_local $l2)
                (i32.const 8))))
          (set_local $l8
            (i64.load
              (i32.add
                (i32.add
                  (get_local $l2)
                  (i32.const 16))
                (i32.const 8))))
          (set_local $p1
            (i64.load
              (get_local $l2)))
          (set_local $l7
            (i64.load offset=16
              (get_local $l2)))
          (block $B20
            (block $B21
              (br_if $B21
                (i32.eqz
                  (get_local $l0)))
              (set_local $l4
                (i64.add
                  (i64.add
                    (get_local $p4)
                    (select
                      (i64.const 1)
                      (i64.extend_u/i32
                        (i64.lt_u
                          (tee_local $l3
                            (i64.add
                              (get_local $p3)
                              (i64.const -1)))
                          (get_local $p3)))
                      (i64.ne
                        (get_local $l3)
                        (i64.const -1))))
                  (i64.const -1)))
              (set_local $l9
                (i64.const 0))
              (set_local $l10
                (i64.const 0))
              (loop $L22
                (set_local $l8
                  (i64.sub
                    (i64.sub
                      (tee_local $l5
                        (i64.or
                          (i64.shl
                            (get_local $l8)
                            (i64.const 1))
                          (i64.shr_u
                            (get_local $l7)
                            (i64.const 63))))
                      (i64.and
                        (tee_local $l5
                          (i64.shr_s
                            (i64.sub
                              (i64.sub
                                (get_local $l4)
                                (get_local $l5))
                              (i64.extend_u/i32
                                (i64.lt_u
                                  (get_local $l3)
                                  (tee_local $l7
                                    (i64.or
                                      (i64.shl
                                        (get_local $l7)
                                        (i64.const 1))
                                      (i64.shr_u
                                        (get_local $p2)
                                        (i64.const 63)))))))
                            (i64.const 63)))
                        (get_local $p4)))
                    (i64.extend_u/i32
                      (i64.lt_u
                        (get_local $l7)
                        (tee_local $l6
                          (i64.and
                            (get_local $l5)
                            (get_local $p3)))))))
                (set_local $l7
                  (i64.sub
                    (get_local $l7)
                    (get_local $l6)))
                (set_local $p2
                  (i64.or
                    (i64.const 0)
                    (i64.or
                      (i64.shl
                        (get_local $p2)
                        (i64.const 1))
                      (i64.shr_u
                        (get_local $p1)
                        (i64.const 63)))))
                (set_local $p1
                  (i64.or
                    (get_local $l10)
                    (i64.shl
                      (get_local $p1)
                      (i64.const 1))))
                (set_local $l10
                  (tee_local $l5
                    (i64.and
                      (get_local $l5)
                      (i64.const 1))))
                (br_if $L22
                  (tee_local $l0
                    (i32.add
                      (get_local $l0)
                      (i32.const -1))))
                (br $B20))
              (unreachable))
            (set_local $l5
              (i64.const 0))
            (set_local $l9
              (i64.const 0)))
          (block $B23
            (br_if $B23
              (i32.eqz
                (get_local $p5)))
            (i64.store
              (get_local $p5)
              (get_local $l7))
            (i64.store
              (i32.add
                (get_local $p5)
                (i32.const 8))
              (get_local $l8)))
          (set_local $p2
            (i64.or
              (get_local $l9)
              (i64.or
                (i64.shl
                  (get_local $p2)
                  (i64.const 1))
                (i64.shr_u
                  (get_local $p1)
                  (i64.const 63)))))
          (set_local $p1
            (i64.or
              (get_local $l5)
              (i64.shl
                (get_local $p1)
                (i64.const 1)))))
        (i64.store
          (get_local $p0)
          (get_local $p1))
        (i64.store
          (i32.add
            (get_local $p0)
            (i32.const 8))
          (get_local $p2))
        (i32.store offset=4
          (i32.const 0)
          (i32.add
            (get_local $l2)
            (i32.const 48)))
        (return))
      (unreachable)
      (unreachable))
    (unreachable)
    (unreachable))
  (func $__umodti3 (export "__umodti3") (type $t9) (param $p0 i32) (param $p1 i64) (param $p2 i64) (param $p3 i64) (param $p4 i64)
    (local $l0 i32) (local $l1 i32)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l1
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 32))))
    (i64.store
      (tee_local $l0
        (i32.add
          (i32.add
            (get_local $l1)
            (i32.const 16))
          (i32.const 8)))
      (i64.const 0))
    (i64.store offset=16
      (get_local $l1)
      (i64.const 0))
    (call $__udivmodti4
      (get_local $l1)
      (get_local $p1)
      (get_local $p2)
      (get_local $p3)
      (get_local $p4)
      (i32.add
        (get_local $l1)
        (i32.const 16)))
    (set_local $p1
      (i64.load offset=16
        (get_local $l1)))
    (i64.store
      (i32.add
        (get_local $p0)
        (i32.const 8))
      (i64.load
        (get_local $l0)))
    (i64.store
      (get_local $p0)
      (get_local $p1))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l1)
        (i32.const 32))))
  (func $__addsf3 (export "__addsf3") (type $t4) (param $p0 f32) (param $p1 f32) (result f32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32)
    (set_local $l3
      (i32.and
        (tee_local $l1
          (i32.reinterpret/f32
            (get_local $p1)))
        (i32.const 2147483647)))
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (block $B4
              (br_if $B4
                (i32.le_u
                  (i32.add
                    (tee_local $l2
                      (i32.and
                        (tee_local $l0
                          (i32.reinterpret/f32
                            (get_local $p0)))
                        (i32.const 2147483647)))
                    (i32.const -1))
                  (i32.const 2139095038)))
              (br_if $B3
                (i32.lt_u
                  (get_local $l2)
                  (i32.const 2139095041)))
              (return
                (f32.reinterpret/i32
                  (i32.or
                    (get_local $l2)
                    (i32.const 4194304)))))
            (br_if $B2
              (i32.le_u
                (i32.add
                  (get_local $l3)
                  (i32.const -1))
                (i32.const 2139095038))))
          (block $B5
            (br_if $B5
              (i32.lt_u
                (get_local $l3)
                (i32.const 2139095041)))
            (return
              (f32.reinterpret/i32
                (i32.or
                  (get_local $l3)
                  (i32.const 4194304)))))
          (block $B6
            (br_if $B6
              (i32.ne
                (get_local $l2)
                (i32.const 2139095040)))
            (return
              (select
                (f32.const nan (;=nan;))
                (get_local $p0)
                (i32.eq
                  (i32.xor
                    (get_local $l1)
                    (get_local $l0))
                  (i32.const -2147483648)))))
          (br_if $B0
            (i32.eq
              (get_local $l3)
              (i32.const 2139095040)))
          (br_if $B1
            (i32.eqz
              (get_local $l2)))
          (set_local $p1
            (get_local $p0))
          (br_if $B0
            (i32.eqz
              (get_local $l3))))
        (set_local $l6
          (i32.and
            (tee_local $l2
              (select
                (get_local $l1)
                (get_local $l0)
                (tee_local $l3
                  (i32.gt_u
                    (get_local $l3)
                    (get_local $l2)))))
            (i32.const 8388607)))
        (set_local $l1
          (i32.and
            (i32.shr_u
              (tee_local $l4
                (select
                  (get_local $l0)
                  (get_local $l1)
                  (get_local $l3)))
              (i32.const 23))
            (i32.const 255)))
        (block $B7
          (br_if $B7
            (tee_local $l3
              (i32.and
                (i32.shr_u
                  (get_local $l2)
                  (i32.const 23))
                (i32.const 255))))
          (set_local $l3
            (i32.sub
              (i32.const 9)
              (tee_local $l0
                (i32.clz
                  (get_local $l6)))))
          (set_local $l6
            (i32.shl
              (get_local $l6)
              (i32.and
                (i32.add
                  (get_local $l0)
                  (i32.const 24))
                (i32.const 31)))))
        (set_local $l0
          (i32.and
            (get_local $l4)
            (i32.const 8388607)))
        (block $B8
          (br_if $B8
            (get_local $l1))
          (set_local $l1
            (i32.sub
              (i32.const 9)
              (tee_local $l5
                (i32.clz
                  (get_local $l0)))))
          (set_local $l0
            (i32.shl
              (get_local $l0)
              (i32.and
                (i32.add
                  (get_local $l5)
                  (i32.const 24))
                (i32.const 31)))))
        (set_local $l4
          (i32.xor
            (get_local $l4)
            (get_local $l2)))
        (set_local $l5
          (i32.or
            (i32.shl
              (get_local $l0)
              (i32.const 3))
            (i32.const 67108864)))
        (set_local $l6
          (i32.shl
            (get_local $l6)
            (i32.const 3)))
        (block $B9
          (block $B10
            (br_if $B10
              (i32.eqz
                (tee_local $l1
                  (i32.sub
                    (get_local $l3)
                    (get_local $l1)))))
            (set_local $l0
              (i32.const 1))
            (br_if $B9
              (i32.gt_u
                (get_local $l1)
                (i32.const 31)))
            (set_local $l0
              (i32.or
                (i32.shr_u
                  (get_local $l5)
                  (i32.and
                    (get_local $l1)
                    (i32.const 31)))
                (i32.ne
                  (i32.shl
                    (get_local $l5)
                    (i32.and
                      (i32.sub
                        (i32.const 0)
                        (get_local $l1))
                      (i32.const 31)))
                  (i32.const 0))))
            (br $B9))
          (set_local $l0
            (get_local $l5)))
        (set_local $l1
          (i32.or
            (get_local $l6)
            (i32.const 67108864)))
        (block $B11
          (block $B12
            (block $B13
              (br_if $B13
                (i32.le_s
                  (get_local $l4)
                  (i32.const -1)))
              (br_if $B12
                (i32.eqz
                  (i32.and
                    (tee_local $l1
                      (i32.add
                        (get_local $l0)
                        (get_local $l1)))
                    (i32.const 134217728))))
              (set_local $l1
                (i32.or
                  (i32.and
                    (i32.add
                      (get_local $l0)
                      (get_local $l6))
                    (i32.const 1))
                  (i32.shr_u
                    (get_local $l1)
                    (i32.const 1))))
              (set_local $l3
                (i32.add
                  (get_local $l3)
                  (i32.const 1)))
              (br $B12))
            (br_if $B11
              (i32.eqz
                (tee_local $l1
                  (i32.sub
                    (get_local $l1)
                    (get_local $l0)))))
            (br_if $B12
              (i32.gt_u
                (get_local $l1)
                (i32.const 67108863)))
            (set_local $l3
              (i32.sub
                (get_local $l3)
                (tee_local $l0
                  (i32.add
                    (i32.clz
                      (get_local $l1))
                    (i32.const -5)))))
            (set_local $l1
              (i32.shl
                (get_local $l1)
                (i32.and
                  (get_local $l0)
                  (i32.const 31)))))
          (set_local $l2
            (i32.and
              (get_local $l2)
              (i32.const -2147483648)))
          (block $B14
            (br_if $B14
              (i32.lt_s
                (get_local $l3)
                (i32.const 255)))
            (return
              (f32.reinterpret/i32
                (i32.or
                  (get_local $l2)
                  (i32.const 2139095040)))))
          (set_local $l0
            (i32.const 0))
          (block $B15
            (block $B16
              (br_if $B16
                (i32.le_s
                  (get_local $l3)
                  (i32.const 0)))
              (set_local $l0
                (get_local $l3))
              (br $B15))
            (set_local $l1
              (i32.or
                (i32.shr_u
                  (get_local $l1)
                  (i32.and
                    (tee_local $l3
                      (i32.sub
                        (i32.const 1)
                        (get_local $l3)))
                    (i32.const 31)))
                (i32.ne
                  (i32.shl
                    (get_local $l1)
                    (i32.and
                      (i32.sub
                        (i32.const 0)
                        (get_local $l3))
                      (i32.const 31)))
                  (i32.const 0)))))
          (set_local $l3
            (i32.or
              (i32.or
                (i32.and
                  (tee_local $l6
                    (i32.shr_u
                      (get_local $l1)
                      (i32.const 3)))
                  (i32.const 8388607))
                (get_local $l2))
              (i32.shl
                (get_local $l0)
                (i32.const 23))))
          (block $B17
            (block $B18
              (br_if $B18
                (i32.lt_u
                  (tee_local $l2
                    (i32.and
                      (get_local $l1)
                      (i32.const 7)))
                  (i32.const 5)))
              (set_local $l3
                (i32.add
                  (get_local $l3)
                  (i32.const 1)))
              (br $B17))
            (br_if $B17
              (i32.ne
                (get_local $l2)
                (i32.const 4)))
            (set_local $l3
              (i32.add
                (get_local $l3)
                (i32.and
                  (get_local $l6)
                  (i32.const 1)))))
          (set_local $p1
            (f32.reinterpret/i32
              (get_local $l3)))
          (br $B0))
        (return
          (f32.const 0x0p+0 (;=0;))))
      (br_if $B0
        (get_local $l3))
      (return
        (f32.reinterpret/i32
          (i32.and
            (get_local $l1)
            (get_local $l0)))))
    (get_local $p1))
  (func $__adddf3 (export "__adddf3") (type $t5) (param $p0 f64) (param $p1 f64) (result f64)
    (local $l0 i32) (local $l1 i32) (local $l2 i64) (local $l3 i64) (local $l4 i64) (local $l5 i64) (local $l6 i64) (local $l7 i64)
    (set_local $l5
      (i64.and
        (tee_local $l3
          (i64.reinterpret/f64
            (get_local $p1)))
        (i64.const 9223372036854775807)))
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (block $B4
              (br_if $B4
                (i64.le_u
                  (i64.add
                    (tee_local $l4
                      (i64.and
                        (tee_local $l2
                          (i64.reinterpret/f64
                            (get_local $p0)))
                        (i64.const 9223372036854775807)))
                    (i64.const -1))
                  (i64.const 9218868437227405310)))
              (br_if $B3
                (i64.lt_u
                  (get_local $l4)
                  (i64.const 9218868437227405313)))
              (return
                (f64.reinterpret/i64
                  (i64.or
                    (get_local $l4)
                    (i64.const 2251799813685248)))))
            (br_if $B2
              (i64.le_u
                (i64.add
                  (get_local $l5)
                  (i64.const -1))
                (i64.const 9218868437227405310))))
          (block $B5
            (br_if $B5
              (i64.lt_u
                (get_local $l5)
                (i64.const 9218868437227405313)))
            (return
              (f64.reinterpret/i64
                (i64.or
                  (get_local $l5)
                  (i64.const 2251799813685248)))))
          (block $B6
            (br_if $B6
              (i64.ne
                (get_local $l4)
                (i64.const 9218868437227405312)))
            (return
              (select
                (f64.const nan (;=nan;))
                (get_local $p0)
                (i64.eq
                  (i64.xor
                    (get_local $l3)
                    (get_local $l2))
                  (i64.const -9223372036854775808)))))
          (br_if $B0
            (i64.eq
              (get_local $l5)
              (i64.const 9218868437227405312)))
          (br_if $B1
            (i64.eq
              (get_local $l4)
              (i64.const 0)))
          (set_local $p1
            (get_local $p0))
          (br_if $B0
            (i64.eqz
              (get_local $l5))))
        (set_local $l4
          (i64.and
            (tee_local $l5
              (select
                (get_local $l3)
                (get_local $l2)
                (tee_local $l1
                  (i64.gt_u
                    (get_local $l5)
                    (get_local $l4)))))
            (i64.const 4503599627370495)))
        (set_local $l0
          (i32.and
            (i32.wrap/i64
              (i64.shr_u
                (tee_local $l2
                  (select
                    (get_local $l2)
                    (get_local $l3)
                    (get_local $l1)))
                (i64.const 52)))
            (i32.const 2047)))
        (block $B7
          (br_if $B7
            (tee_local $l1
              (i32.and
                (i32.wrap/i64
                  (i64.shr_u
                    (get_local $l5)
                    (i64.const 52)))
                (i32.const 2047))))
          (set_local $l1
            (i32.sub
              (i32.const 12)
              (i32.wrap/i64
                (tee_local $l3
                  (i64.clz
                    (get_local $l4))))))
          (set_local $l4
            (i64.shl
              (get_local $l4)
              (i64.and
                (i64.add
                  (get_local $l3)
                  (i64.const 53))
                (i64.const 63)))))
        (set_local $l3
          (i64.and
            (get_local $l2)
            (i64.const 4503599627370495)))
        (block $B8
          (br_if $B8
            (get_local $l0))
          (set_local $l0
            (i32.sub
              (i32.const 12)
              (i32.wrap/i64
                (tee_local $l6
                  (i64.clz
                    (get_local $l3))))))
          (set_local $l3
            (i64.shl
              (get_local $l3)
              (i64.and
                (i64.add
                  (get_local $l6)
                  (i64.const 53))
                (i64.const 63)))))
        (set_local $l6
          (i64.xor
            (get_local $l2)
            (get_local $l5)))
        (set_local $l7
          (i64.or
            (i64.shl
              (get_local $l3)
              (i64.const 3))
            (i64.const 36028797018963968)))
        (set_local $l2
          (i64.shl
            (get_local $l4)
            (i64.const 3)))
        (block $B9
          (block $B10
            (br_if $B10
              (i32.eqz
                (tee_local $l0
                  (i32.sub
                    (get_local $l1)
                    (get_local $l0)))))
            (set_local $l3
              (i64.const 1))
            (br_if $B9
              (i32.gt_u
                (get_local $l0)
                (i32.const 63)))
            (set_local $l3
              (i64.or
                (i64.shr_u
                  (get_local $l7)
                  (i64.extend_u/i32
                    (i32.and
                      (get_local $l0)
                      (i32.const 63))))
                (i64.extend_u/i32
                  (i64.ne
                    (i64.shl
                      (get_local $l7)
                      (i64.extend_u/i32
                        (i32.and
                          (i32.sub
                            (i32.const 0)
                            (get_local $l0))
                          (i32.const 63))))
                    (i64.const 0)))))
            (br $B9))
          (set_local $l3
            (get_local $l7)))
        (set_local $l4
          (i64.or
            (get_local $l2)
            (i64.const 36028797018963968)))
        (block $B11
          (block $B12
            (block $B13
              (br_if $B13
                (i64.le_s
                  (get_local $l6)
                  (i64.const -1)))
              (br_if $B12
                (i64.eqz
                  (i64.and
                    (tee_local $l4
                      (i64.add
                        (get_local $l3)
                        (get_local $l4)))
                    (i64.const 72057594037927936))))
              (set_local $l4
                (i64.or
                  (i64.and
                    (i64.add
                      (get_local $l3)
                      (get_local $l2))
                    (i64.const 1))
                  (i64.shr_u
                    (get_local $l4)
                    (i64.const 1))))
              (set_local $l1
                (i32.add
                  (get_local $l1)
                  (i32.const 1)))
              (br $B12))
            (br_if $B11
              (i64.eqz
                (tee_local $l4
                  (i64.sub
                    (get_local $l4)
                    (get_local $l3)))))
            (br_if $B12
              (i64.gt_u
                (get_local $l4)
                (i64.const 36028797018963967)))
            (set_local $l1
              (i32.sub
                (get_local $l1)
                (tee_local $l0
                  (i32.add
                    (i32.wrap/i64
                      (i64.clz
                        (get_local $l4)))
                    (i32.const -8)))))
            (set_local $l4
              (i64.shl
                (get_local $l4)
                (i64.extend_u/i32
                  (i32.and
                    (get_local $l0)
                    (i32.const 63))))))
          (set_local $l5
            (i64.and
              (get_local $l5)
              (i64.const -9223372036854775808)))
          (block $B14
            (br_if $B14
              (i32.lt_s
                (get_local $l1)
                (i32.const 2047)))
            (return
              (f64.reinterpret/i64
                (i64.or
                  (get_local $l5)
                  (i64.const 9218868437227405312)))))
          (set_local $l0
            (i32.const 0))
          (block $B15
            (block $B16
              (br_if $B16
                (i32.le_s
                  (get_local $l1)
                  (i32.const 0)))
              (set_local $l0
                (get_local $l1))
              (br $B15))
            (set_local $l4
              (i64.or
                (i64.shr_u
                  (get_local $l4)
                  (i64.extend_u/i32
                    (i32.and
                      (tee_local $l1
                        (i32.sub
                          (i32.const 1)
                          (get_local $l1)))
                      (i32.const 63))))
                (i64.extend_u/i32
                  (i64.ne
                    (i64.shl
                      (get_local $l4)
                      (i64.extend_u/i32
                        (i32.and
                          (i32.sub
                            (i32.const 0)
                            (get_local $l1))
                          (i32.const 63))))
                    (i64.const 0))))))
          (set_local $l5
            (i64.or
              (i64.or
                (i64.and
                  (tee_local $l3
                    (i64.shr_u
                      (get_local $l4)
                      (i64.const 3)))
                  (i64.const 4503599627370495))
                (get_local $l5))
              (i64.shl
                (i64.extend_u/i32
                  (get_local $l0))
                (i64.const 52))))
          (block $B17
            (block $B18
              (br_if $B18
                (i32.lt_u
                  (tee_local $l1
                    (i32.and
                      (i32.wrap/i64
                        (get_local $l4))
                      (i32.const 7)))
                  (i32.const 5)))
              (set_local $l5
                (i64.add
                  (get_local $l5)
                  (i64.const 1)))
              (br $B17))
            (br_if $B17
              (i32.ne
                (get_local $l1)
                (i32.const 4)))
            (set_local $l5
              (i64.add
                (get_local $l5)
                (i64.and
                  (get_local $l3)
                  (i64.const 1)))))
          (set_local $p1
            (f64.reinterpret/i64
              (get_local $l5)))
          (br $B0))
        (return
          (f64.const 0x0p+0 (;=0;))))
      (br_if $B0
        (i32.eqz
          (i64.eqz
            (get_local $l5))))
      (return
        (f64.reinterpret/i64
          (i64.and
            (get_local $l3)
            (get_local $l2)))))
    (get_local $p1))
  (func $__muldi3 (export "__muldi3") (type $t7) (param $p0 i64) (param $p1 i64) (result i64)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32)
    (i64.or
      (i64.shl
        (i64.extend_u/i32
          (i32.add
            (i32.mul
              (i32.wrap/i64
                (i64.shr_u
                  (get_local $p1)
                  (i64.const 32)))
              (tee_local $l0
                (i32.wrap/i64
                  (get_local $p0))))
            (i32.add
              (i32.mul
                (tee_local $l2
                  (i32.wrap/i64
                    (get_local $p1)))
                (i32.wrap/i64
                  (i64.shr_u
                    (get_local $p0)
                    (i64.const 32))))
              (i32.add
                (i32.add
                  (i32.shr_u
                    (i32.add
                      (tee_local $l5
                        (i32.mul
                          (tee_local $l3
                            (i32.and
                              (get_local $l0)
                              (i32.const 65535)))
                          (tee_local $l4
                            (i32.shr_u
                              (get_local $l2)
                              (i32.const 16)))))
                      (i32.and
                        (tee_local $l0
                          (i32.add
                            (i32.mul
                              (tee_local $l2
                                (i32.and
                                  (get_local $l2)
                                  (i32.const 65535)))
                              (tee_local $l1
                                (i32.shr_u
                                  (get_local $l0)
                                  (i32.const 16))))
                            (i32.shr_u
                              (tee_local $l2
                                (i32.mul
                                  (get_local $l2)
                                  (get_local $l3)))
                              (i32.const 16))))
                        (i32.const 65535)))
                    (i32.const 16))
                  (i32.shr_u
                    (get_local $l0)
                    (i32.const 16)))
                (i32.mul
                  (get_local $l4)
                  (get_local $l1))))))
        (i64.const 32))
      (i64.extend_u/i32
        (i32.or
          (i32.shl
            (i32.add
              (get_local $l5)
              (get_local $l0))
            (i32.const 16))
          (i32.and
            (get_local $l2)
            (i32.const 65535))))))
  (func $__multi3 (export "__multi3") (type $t9) (param $p0 i32) (param $p1 i64) (param $p2 i64) (param $p3 i64) (param $p4 i64)
    (local $l0 i64) (local $l1 i64) (local $l2 i64) (local $l3 i64) (local $l4 i64)
    (i64.store
      (get_local $p0)
      (i64.or
        (i64.shl
          (i64.add
            (tee_local $l4
              (i64.mul
                (tee_local $l2
                  (i64.and
                    (get_local $p1)
                    (i64.const 4294967295)))
                (tee_local $l3
                  (i64.shr_u
                    (get_local $p3)
                    (i64.const 32)))))
            (tee_local $l2
              (i64.add
                (i64.mul
                  (tee_local $l1
                    (i64.and
                      (get_local $p3)
                      (i64.const 4294967295)))
                  (tee_local $l0
                    (i64.shr_u
                      (get_local $p1)
                      (i64.const 32))))
                (i64.shr_u
                  (tee_local $l1
                    (i64.mul
                      (get_local $l1)
                      (get_local $l2)))
                  (i64.const 32)))))
          (i64.const 32))
        (i64.and
          (get_local $l1)
          (i64.const 4294967295))))
    (i64.store
      (i32.add
        (get_local $p0)
        (i32.const 8))
      (i64.add
        (i64.mul
          (get_local $p4)
          (get_local $p1))
        (i64.add
          (i64.mul
            (get_local $p3)
            (get_local $p2))
          (i64.add
            (i64.add
              (i64.shr_u
                (i64.add
                  (get_local $l4)
                  (i64.and
                    (get_local $l2)
                    (i64.const 4294967295)))
                (i64.const 32))
              (i64.shr_u
                (get_local $l2)
                (i64.const 32)))
            (i64.mul
              (get_local $l3)
              (get_local $l0)))))))
  (func $__mulosi4 (export "__mulosi4") (type $t3) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32)
    (i32.store
      (get_local $p2)
      (i32.const 0))
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.ne
              (get_local $p0)
              (i32.const -2147483648)))
          (br_if $B1
            (i32.lt_u
              (get_local $p1)
              (i32.const 2)))
          (i32.store
            (get_local $p2)
            (i32.const 1))
          (return
            (i32.mul
              (get_local $p1)
              (get_local $p0))))
        (block $B3
          (br_if $B3
            (i32.ne
              (get_local $p1)
              (i32.const -2147483648)))
          (br_if $B1
            (i32.lt_u
              (get_local $p0)
              (i32.const 2)))
          (i32.store
            (get_local $p2)
            (i32.const 1))
          (return
            (i32.mul
              (get_local $p1)
              (get_local $p0))))
        (br_if $B1
          (i32.lt_s
            (tee_local $l1
              (i32.sub
                (i32.xor
                  (tee_local $l0
                    (i32.shr_s
                      (get_local $p0)
                      (i32.const 31)))
                  (get_local $p0))
                (get_local $l0)))
            (i32.const 2)))
        (br_if $B1
          (i32.lt_s
            (tee_local $l3
              (i32.sub
                (i32.xor
                  (tee_local $l2
                    (i32.shr_s
                      (get_local $p1)
                      (i32.const 31)))
                  (get_local $p1))
                (get_local $l2)))
            (i32.const 2)))
        (block $B4
          (br_if $B4
            (i32.ne
              (get_local $l0)
              (get_local $l2)))
          (br_if $B0
            (i32.eqz
              (get_local $l3)))
          (br_if $B1
            (i32.le_s
              (get_local $l1)
              (i32.div_s
                (i32.const 2147483647)
                (get_local $l3))))
          (i32.store
            (get_local $p2)
            (i32.const 1))
          (return
            (i32.mul
              (get_local $p1)
              (get_local $p0))))
        (br_if $B0
          (i32.eqz
            (get_local $l3)))
        (br_if $B0
          (i32.eq
            (tee_local $l0
              (i32.sub
                (i32.const 0)
                (get_local $l3)))
            (i32.const -1)))
        (br_if $B1
          (i32.le_s
            (get_local $l1)
            (i32.div_s
              (i32.const -2147483648)
              (get_local $l0))))
        (i32.store
          (get_local $p2)
          (i32.const 1)))
      (return
        (i32.mul
          (get_local $p1)
          (get_local $p0))))
    (unreachable)
    (unreachable))
  (func $__mulodi4 (export "__mulodi4") (type $t8) (param $p0 i64) (param $p1 i64) (param $p2 i32) (result i64)
    (local $l0 i64) (local $l1 i64) (local $l2 i64) (local $l3 i64)
    (i32.store
      (get_local $p2)
      (i32.const 0))
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i64.ne
              (get_local $p0)
              (i64.const -9223372036854775808)))
          (br_if $B1
            (i64.lt_u
              (get_local $p1)
              (i64.const 2)))
          (i32.store
            (get_local $p2)
            (i32.const 1))
          (return
            (i64.mul
              (get_local $p1)
              (get_local $p0))))
        (block $B3
          (br_if $B3
            (i64.ne
              (get_local $p1)
              (i64.const -9223372036854775808)))
          (br_if $B1
            (i64.lt_u
              (get_local $p0)
              (i64.const 2)))
          (i32.store
            (get_local $p2)
            (i32.const 1))
          (return
            (i64.mul
              (get_local $p1)
              (get_local $p0))))
        (br_if $B1
          (i64.lt_s
            (tee_local $l1
              (i64.sub
                (i64.xor
                  (tee_local $l0
                    (i64.shr_s
                      (get_local $p0)
                      (i64.const 63)))
                  (get_local $p0))
                (get_local $l0)))
            (i64.const 2)))
        (br_if $B1
          (i64.lt_s
            (tee_local $l3
              (i64.sub
                (i64.xor
                  (tee_local $l2
                    (i64.shr_s
                      (get_local $p1)
                      (i64.const 63)))
                  (get_local $p1))
                (get_local $l2)))
            (i64.const 2)))
        (block $B4
          (br_if $B4
            (i64.ne
              (get_local $l0)
              (get_local $l2)))
          (br_if $B0
            (i64.eq
              (get_local $l3)
              (i64.const 0)))
          (br_if $B1
            (i64.le_s
              (get_local $l1)
              (i64.div_s
                (i64.const 9223372036854775807)
                (get_local $l3))))
          (i32.store
            (get_local $p2)
            (i32.const 1))
          (return
            (i64.mul
              (get_local $p1)
              (get_local $p0))))
        (br_if $B0
          (i64.eqz
            (get_local $l3)))
        (br_if $B0
          (i64.eq
            (tee_local $l0
              (i64.sub
                (i64.const 0)
                (get_local $l3)))
            (i64.const -1)))
        (br_if $B1
          (i64.le_s
            (get_local $l1)
            (i64.div_s
              (i64.const -9223372036854775808)
              (get_local $l0))))
        (i32.store
          (get_local $p2)
          (i32.const 1)))
      (return
        (i64.mul
          (get_local $p1)
          (get_local $p0))))
    (unreachable)
    (unreachable))
  (func $__muloti4 (export "__muloti4") (type $t10) (param $p0 i32) (param $p1 i64) (param $p2 i64) (param $p3 i64) (param $p4 i64) (param $p5 i32)
    (local $l0 i32) (local $l1 i64) (local $l2 i64) (local $l3 i64) (local $l4 i64) (local $l5 i64)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l0
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 48))))
    (call $__multi3
      (i32.add
        (get_local $l0)
        (i32.const 32))
      (get_local $p3)
      (get_local $p4)
      (get_local $p1)
      (get_local $p2))
    (i32.store
      (get_local $p5)
      (i32.const 0))
    (set_local $l2
      (i64.load
        (i32.add
          (get_local $l0)
          (i32.const 40))))
    (set_local $l1
      (i64.load offset=32
        (get_local $l0)))
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i64.ne
              (i64.or
                (get_local $p1)
                (i64.xor
                  (get_local $p2)
                  (i64.const -9223372036854775808)))
              (i64.const 0)))
          (br_if $B1
            (select
              (i64.lt_u
                (get_local $p3)
                (i64.const 2))
              (i32.const 0)
              (i64.eqz
                (get_local $p4))))
          (i32.store
            (get_local $p5)
            (i32.const 1))
          (br $B1))
        (block $B3
          (br_if $B3
            (i32.eqz
              (i64.eqz
                (i64.or
                  (get_local $p3)
                  (i64.xor
                    (get_local $p4)
                    (i64.const -9223372036854775808))))))
          (br_if $B1
            (select
              (i64.lt_u
                (get_local $p1)
                (i64.const 2))
              (i32.const 0)
              (i64.eqz
                (get_local $p2))))
          (i32.store
            (get_local $p5)
            (i32.const 1))
          (br $B1))
        (br_if $B1
          (select
            (i64.lt_u
              (tee_local $l4
                (i64.sub
                  (tee_local $p1
                    (i64.xor
                      (tee_local $l3
                        (i64.shr_s
                          (get_local $p2)
                          (i64.const 63)))
                      (get_local $p1)))
                  (get_local $l3)))
              (i64.const 2))
            (i64.lt_s
              (tee_local $p1
                (i64.sub
                  (i64.sub
                    (i64.xor
                      (get_local $l3)
                      (get_local $p2))
                    (get_local $l3))
                  (i64.extend_u/i32
                    (i64.lt_u
                      (get_local $p1)
                      (get_local $l3)))))
              (i64.const 0))
            (i64.eqz
              (get_local $p1))))
        (br_if $B1
          (select
            (i64.lt_u
              (tee_local $p3
                (i64.sub
                  (tee_local $l5
                    (i64.xor
                      (tee_local $p2
                        (i64.shr_s
                          (get_local $p4)
                          (i64.const 63)))
                      (get_local $p3)))
                  (get_local $p2)))
              (i64.const 2))
            (i64.lt_s
              (tee_local $p4
                (i64.sub
                  (i64.sub
                    (i64.xor
                      (get_local $p2)
                      (get_local $p4))
                    (get_local $p2))
                  (i64.extend_u/i32
                    (i64.lt_u
                      (get_local $l5)
                      (get_local $p2)))))
              (i64.const 0))
            (i64.eqz
              (get_local $p4))))
        (block $B4
          (br_if $B4
            (i64.ne
              (i64.or
                (tee_local $p2
                  (i64.xor
                    (get_local $l3)
                    (get_local $p2)))
                (get_local $p2))
              (i64.const 0)))
          (br_if $B0
            (i64.eq
              (i64.or
                (get_local $p3)
                (get_local $p4))
              (i64.const 0)))
          (call $__divti3
            (get_local $l0)
            (i64.const -1)
            (i64.const 9223372036854775807)
            (get_local $p3)
            (get_local $p4))
          (br_if $B1
            (i32.eqz
              (select
                (i64.gt_u
                  (get_local $l4)
                  (i64.load
                    (get_local $l0)))
                (i64.gt_s
                  (get_local $p1)
                  (tee_local $p2
                    (i64.load
                      (i32.add
                        (get_local $l0)
                        (i32.const 8)))))
                (i64.eq
                  (get_local $p1)
                  (get_local $p2)))))
          (i32.store
            (get_local $p5)
            (i32.const 1))
          (br $B1))
        (br_if $B0
          (i64.eqz
            (i64.or
              (get_local $p3)
              (get_local $p4))))
        (br_if $B0
          (i64.eq
            (i64.and
              (tee_local $p2
                (i64.sub
                  (i64.const 0)
                  (get_local $p3)))
              (tee_local $p4
                (i64.sub
                  (i64.sub
                    (i64.const 0)
                    (get_local $p4))
                  (i64.extend_u/i32
                    (i64.ne
                      (get_local $p3)
                      (i64.const 0))))))
            (i64.const -1)))
        (call $__divti3
          (i32.add
            (get_local $l0)
            (i32.const 16))
          (i64.const 0)
          (i64.const -9223372036854775808)
          (get_local $p2)
          (get_local $p4))
        (br_if $B1
          (i32.eqz
            (select
              (i64.gt_u
                (get_local $l4)
                (i64.load offset=16
                  (get_local $l0)))
              (i64.gt_s
                (get_local $p1)
                (tee_local $p2
                  (i64.load
                    (i32.add
                      (get_local $l0)
                      (i32.const 24)))))
              (i64.eq
                (get_local $p1)
                (get_local $p2)))))
        (i32.store
          (get_local $p5)
          (i32.const 1)))
      (i64.store
        (get_local $p0)
        (get_local $l1))
      (i64.store
        (i32.add
          (get_local $p0)
          (i32.const 8))
        (get_local $l2))
      (i32.store offset=4
        (i32.const 0)
        (i32.add
          (get_local $l0)
          (i32.const 48)))
      (return))
    (unreachable)
    (unreachable))
  (func $__powisf2 (export "__powisf2") (type $t11) (param $p0 f32) (param $p1 i32) (result f32)
    (local $l0 i32) (local $l1 f32)
    (set_local $l1
      (select
        (get_local $p0)
        (f32.const 0x1p+0 (;=1;))
        (i32.and
          (get_local $p1)
          (i32.const 1))))
    (block $B0
      (br_if $B0
        (i32.lt_u
          (i32.add
            (get_local $p1)
            (i32.const 1))
          (i32.const 3)))
      (set_local $l0
        (get_local $p1))
      (loop $L1
        (set_local $l1
          (select
            (f32.mul
              (get_local $l1)
              (tee_local $p0
                (f32.mul
                  (get_local $p0)
                  (get_local $p0))))
            (get_local $l1)
            (i32.and
              (tee_local $l0
                (i32.div_s
                  (get_local $l0)
                  (i32.const 2)))
              (i32.const 1))))
        (br_if $L1
          (i32.gt_u
            (i32.add
              (get_local $l0)
              (i32.const 1))
            (i32.const 2)))))
    (select
      (f32.div
        (f32.const 0x1p+0 (;=1;))
        (get_local $l1))
      (get_local $l1)
      (i32.lt_s
        (get_local $p1)
        (i32.const 0))))
  (func $__powidf2 (export "__powidf2") (type $t12) (param $p0 f64) (param $p1 i32) (result f64)
    (local $l0 i32) (local $l1 f64)
    (set_local $l1
      (select
        (get_local $p0)
        (f64.const 0x1p+0 (;=1;))
        (i32.and
          (get_local $p1)
          (i32.const 1))))
    (block $B0
      (br_if $B0
        (i32.lt_u
          (i32.add
            (get_local $p1)
            (i32.const 1))
          (i32.const 3)))
      (set_local $l0
        (get_local $p1))
      (loop $L1
        (set_local $l1
          (select
            (f64.mul
              (get_local $l1)
              (tee_local $p0
                (f64.mul
                  (get_local $p0)
                  (get_local $p0))))
            (get_local $l1)
            (i32.and
              (tee_local $l0
                (i32.div_s
                  (get_local $l0)
                  (i32.const 2)))
              (i32.const 1))))
        (br_if $L1
          (i32.gt_u
            (i32.add
              (get_local $l0)
              (i32.const 1))
            (i32.const 2)))))
    (select
      (f64.div
        (f64.const 0x1p+0 (;=1;))
        (get_local $l1))
      (get_local $l1)
      (i32.lt_s
        (get_local $p1)
        (i32.const 0))))
  (func $__mulsf3 (export "__mulsf3") (type $t4) (param $p0 f32) (param $p1 f32) (result f32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i64)
    (set_local $l5
      (i32.and
        (tee_local $l1
          (i32.reinterpret/f32
            (get_local $p1)))
        (i32.const 8388607)))
    (set_local $l4
      (i32.and
        (tee_local $l0
          (i32.reinterpret/f32
            (get_local $p0)))
        (i32.const 8388607)))
    (set_local $l9
      (i32.and
        (i32.xor
          (get_local $l1)
          (get_local $l0))
        (i32.const -2147483648)))
    (set_local $l3
      (i32.and
        (i32.shr_u
          (get_local $l1)
          (i32.const 23))
        (i32.const 255)))
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.gt_u
              (i32.add
                (tee_local $l2
                  (i32.and
                    (i32.shr_u
                      (get_local $l0)
                      (i32.const 23))
                    (i32.const 255)))
                (i32.const -1))
              (i32.const 253)))
          (set_local $l8
            (i32.const 0))
          (br_if $B1
            (i32.lt_u
              (i32.add
                (get_local $l3)
                (i32.const -1))
              (i32.const 254))))
        (block $B3
          (br_if $B3
            (i32.lt_u
              (tee_local $l6
                (i32.and
                  (get_local $l0)
                  (i32.const 2147483647)))
              (i32.const 2139095041)))
          (return
            (f32.reinterpret/i32
              (i32.or
                (get_local $l0)
                (i32.const 4194304)))))
        (block $B4
          (br_if $B4
            (i32.lt_u
              (tee_local $l7
                (i32.and
                  (get_local $l1)
                  (i32.const 2147483647)))
              (i32.const 2139095041)))
          (return
            (f32.reinterpret/i32
              (i32.or
                (get_local $l1)
                (i32.const 4194304)))))
        (block $B5
          (br_if $B5
            (i32.ne
              (get_local $l6)
              (i32.const 2139095040)))
          (return
            (f32.reinterpret/i32
              (select
                (i32.xor
                  (i32.and
                    (get_local $l1)
                    (i32.const -2147483648))
                  (get_local $l0))
                (i32.const 2143289344)
                (get_local $l7)))))
        (block $B6
          (br_if $B6
            (i32.ne
              (get_local $l7)
              (i32.const 2139095040)))
          (return
            (f32.reinterpret/i32
              (select
                (i32.xor
                  (i32.and
                    (get_local $l0)
                    (i32.const -2147483648))
                  (get_local $l1))
                (i32.const 2143289344)
                (get_local $l6)))))
        (br_if $B0
          (i32.eqz
            (get_local $l6)))
        (br_if $B0
          (i32.eqz
            (get_local $l7)))
        (set_local $l8
          (i32.const 0))
        (block $B7
          (br_if $B7
            (i32.gt_u
              (get_local $l6)
              (i32.const 8388607)))
          (set_local $l8
            (i32.sub
              (i32.const 9)
              (tee_local $l0
                (i32.clz
                  (get_local $l4)))))
          (set_local $l4
            (i32.shl
              (get_local $l4)
              (i32.and
                (i32.add
                  (get_local $l0)
                  (i32.const 24))
                (i32.const 31)))))
        (br_if $B1
          (i32.gt_u
            (get_local $l7)
            (i32.const 8388607)))
        (set_local $l8
          (i32.add
            (i32.sub
              (i32.const 9)
              (tee_local $l0
                (i32.clz
                  (get_local $l5))))
            (get_local $l8)))
        (set_local $l5
          (i32.shl
            (get_local $l5)
            (i32.and
              (i32.add
                (get_local $l0)
                (i32.const 24))
              (i32.const 31)))))
      (set_local $l0
        (i32.wrap/i64
          (tee_local $l10
            (i64.mul
              (i64.extend_u/i32
                (i32.or
                  (i32.shl
                    (get_local $l5)
                    (i32.const 8))
                  (i32.const -2147483648)))
              (i64.extend_u/i32
                (i32.or
                  (get_local $l4)
                  (i32.const 8388608)))))))
      (set_local $l1
        (i32.add
          (i32.add
            (get_local $l2)
            (get_local $l8))
          (get_local $l3)))
      (block $B8
        (block $B9
          (br_if $B9
            (i32.and
              (tee_local $l3
                (i32.wrap/i64
                  (tee_local $l10
                    (i64.shr_u
                      (get_local $l10)
                      (i64.const 32)))))
              (i32.const 8388608)))
          (set_local $l3
            (i32.or
              (i32.shr_u
                (get_local $l0)
                (i32.const 31))
              (i32.shl
                (i32.wrap/i64
                  (get_local $l10))
                (i32.const 1))))
          (set_local $l0
            (i32.shl
              (get_local $l0)
              (i32.const 1)))
          (set_local $l1
            (i32.add
              (get_local $l1)
              (i32.const -127)))
          (br $B8))
        (set_local $l1
          (i32.add
            (get_local $l1)
            (i32.const -126))))
      (block $B10
        (br_if $B10
          (i32.lt_s
            (get_local $l1)
            (i32.const 255)))
        (return
          (f32.reinterpret/i32
            (i32.or
              (get_local $l9)
              (i32.const 2139095040)))))
      (block $B11
        (block $B12
          (br_if $B12
            (i32.le_s
              (get_local $l1)
              (i32.const 0)))
          (set_local $l1
            (i32.or
              (i32.and
                (get_local $l3)
                (i32.const 8388607))
              (i32.shl
                (get_local $l1)
                (i32.const 23))))
          (br $B11))
        (br_if $B0
          (i32.gt_s
            (tee_local $l1
              (i32.sub
                (i32.const 1)
                (get_local $l1)))
            (i32.const 31)))
        (set_local $l0
          (i32.or
            (i32.rotr
              (get_local $l0)
              (get_local $l1))
            (i32.shl
              (get_local $l3)
              (i32.and
                (i32.sub
                  (i32.const 0)
                  (get_local $l1))
                (i32.const 31)))))
        (set_local $l1
          (i32.shr_u
            (get_local $l3)
            (i32.and
              (get_local $l1)
              (i32.const 31)))))
      (set_local $l9
        (i32.or
          (get_local $l1)
          (get_local $l9)))
      (block $B13
        (br_if $B13
          (i32.lt_u
            (get_local $l0)
            (i32.const -2147483647)))
        (return
          (f32.reinterpret/i32
            (i32.add
              (get_local $l9)
              (i32.const 1)))))
      (br_if $B0
        (i32.ne
          (get_local $l0)
          (i32.const -2147483648)))
      (set_local $l9
        (i32.add
          (i32.and
            (get_local $l1)
            (i32.const 1))
          (get_local $l9))))
    (f32.reinterpret/i32
      (get_local $l9)))
  (func $__muldf3 (export "__muldf3") (type $t5) (param $p0 f64) (param $p1 f64) (result f64)
    (local $l0 i32) (local $l1 i32) (local $l2 i64) (local $l3 i64) (local $l4 i64) (local $l5 i64) (local $l6 i64) (local $l7 i64) (local $l8 i64) (local $l9 i64) (local $l10 i64)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l1
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 16))))
    (set_local $l7
      (i64.and
        (tee_local $l3
          (i64.reinterpret/f64
            (get_local $p1)))
        (i64.const 4503599627370495)))
    (set_local $l6
      (i64.and
        (tee_local $l2
          (i64.reinterpret/f64
            (get_local $p0)))
        (i64.const 4503599627370495)))
    (set_local $l10
      (i64.and
        (i64.xor
          (get_local $l3)
          (get_local $l2))
        (i64.const -9223372036854775808)))
    (set_local $l5
      (i64.and
        (i64.shr_u
          (get_local $l3)
          (i64.const 52))
        (i64.const 2047)))
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i64.gt_u
              (i64.add
                (tee_local $l4
                  (i64.and
                    (i64.shr_u
                      (get_local $l2)
                      (i64.const 52))
                    (i64.const 2047)))
                (i64.const -1))
              (i64.const 2045)))
          (set_local $l0
            (i32.const 0))
          (br_if $B1
            (i64.lt_u
              (i64.add
                (get_local $l5)
                (i64.const -1))
              (i64.const 2046))))
        (block $B3
          (br_if $B3
            (i64.lt_u
              (tee_local $l8
                (i64.and
                  (get_local $l2)
                  (i64.const 9223372036854775807)))
              (i64.const 9218868437227405313)))
          (set_local $l10
            (i64.or
              (get_local $l2)
              (i64.const 2251799813685248)))
          (br $B0))
        (block $B4
          (br_if $B4
            (i64.lt_u
              (tee_local $l9
                (i64.and
                  (get_local $l3)
                  (i64.const 9223372036854775807)))
              (i64.const 9218868437227405313)))
          (set_local $l10
            (i64.or
              (get_local $l3)
              (i64.const 2251799813685248)))
          (br $B0))
        (block $B5
          (br_if $B5
            (i64.ne
              (get_local $l8)
              (i64.const 9218868437227405312)))
          (set_local $l10
            (select
              (i64.xor
                (i64.and
                  (get_local $l3)
                  (i64.const -9223372036854775808))
                (get_local $l2))
              (i64.const 9221120237041090560)
              (i64.ne
                (get_local $l9)
                (i64.const 0))))
          (br $B0))
        (block $B6
          (br_if $B6
            (i64.ne
              (get_local $l9)
              (i64.const 9218868437227405312)))
          (set_local $l10
            (select
              (i64.xor
                (i64.and
                  (get_local $l2)
                  (i64.const -9223372036854775808))
                (get_local $l3))
              (i64.const 9221120237041090560)
              (i64.ne
                (get_local $l8)
                (i64.const 0))))
          (br $B0))
        (br_if $B0
          (i64.eqz
            (get_local $l8)))
        (br_if $B0
          (i64.eqz
            (get_local $l9)))
        (set_local $l0
          (i32.const 0))
        (block $B7
          (br_if $B7
            (i64.gt_u
              (get_local $l8)
              (i64.const 4503599627370495)))
          (set_local $l0
            (i32.sub
              (i32.const 12)
              (i32.wrap/i64
                (tee_local $l2
                  (i64.clz
                    (get_local $l6))))))
          (set_local $l6
            (i64.shl
              (get_local $l6)
              (i64.and
                (i64.add
                  (get_local $l2)
                  (i64.const 53))
                (i64.const 63)))))
        (br_if $B1
          (i64.gt_u
            (get_local $l9)
            (i64.const 4503599627370495)))
        (set_local $l0
          (i32.add
            (i32.sub
              (i32.const 12)
              (i32.wrap/i64
                (tee_local $l2
                  (i64.clz
                    (get_local $l7)))))
            (get_local $l0)))
        (set_local $l7
          (i64.shl
            (get_local $l7)
            (i64.and
              (i64.add
                (get_local $l2)
                (i64.const 53))
              (i64.const 63)))))
      (call $__multi3
        (get_local $l1)
        (i64.or
          (i64.shl
            (get_local $l7)
            (i64.const 11))
          (i64.const -9223372036854775808))
        (i64.const 0)
        (i64.or
          (get_local $l6)
          (i64.const 4503599627370496))
        (i64.const 0))
      (set_local $l0
        (i32.add
          (i32.add
            (i32.wrap/i64
              (get_local $l4))
            (get_local $l0))
          (i32.wrap/i64
            (get_local $l5))))
      (set_local $l2
        (i64.load
          (get_local $l1)))
      (block $B8
        (block $B9
          (br_if $B9
            (i32.eqz
              (i64.eqz
                (i64.and
                  (tee_local $l3
                    (i64.load
                      (i32.add
                        (get_local $l1)
                        (i32.const 8))))
                  (i64.const 4503599627370496)))))
          (set_local $l3
            (i64.or
              (i64.shr_u
                (get_local $l2)
                (i64.const 63))
              (i64.shl
                (get_local $l3)
                (i64.const 1))))
          (set_local $l2
            (i64.shl
              (get_local $l2)
              (i64.const 1)))
          (set_local $l0
            (i32.add
              (get_local $l0)
              (i32.const -1023)))
          (br $B8))
        (set_local $l0
          (i32.add
            (get_local $l0)
            (i32.const -1022))))
      (block $B10
        (br_if $B10
          (i32.lt_s
            (get_local $l0)
            (i32.const 2047)))
        (set_local $l10
          (i64.or
            (get_local $l10)
            (i64.const 9218868437227405312)))
        (br $B0))
      (block $B11
        (block $B12
          (br_if $B12
            (i32.le_s
              (get_local $l0)
              (i32.const 0)))
          (set_local $l3
            (i64.or
              (i64.and
                (get_local $l3)
                (i64.const 4503599627370495))
              (i64.shl
                (i64.extend_u/i32
                  (get_local $l0))
                (i64.const 52))))
          (br $B11))
        (br_if $B0
          (i32.gt_s
            (tee_local $l0
              (i32.sub
                (i32.const 1)
                (get_local $l0)))
            (i32.const 63)))
        (set_local $l2
          (i64.or
            (i64.rotr
              (get_local $l2)
              (tee_local $l5
                (i64.extend_u/i32
                  (i32.and
                    (get_local $l0)
                    (i32.const 63)))))
            (i64.shl
              (get_local $l3)
              (i64.extend_u/i32
                (i32.and
                  (i32.sub
                    (i32.const 0)
                    (get_local $l0))
                  (i32.const 63))))))
        (set_local $l3
          (i64.shr_u
            (get_local $l3)
            (get_local $l5))))
      (set_local $l10
        (i64.or
          (get_local $l3)
          (get_local $l10)))
      (block $B13
        (br_if $B13
          (i64.lt_u
            (get_local $l2)
            (i64.const -9223372036854775807)))
        (set_local $l10
          (i64.add
            (get_local $l10)
            (i64.const 1)))
        (br $B0))
      (br_if $B0
        (i64.ne
          (get_local $l2)
          (i64.const -9223372036854775808)))
      (set_local $l10
        (i64.add
          (i64.and
            (get_local $l3)
            (i64.const 1))
          (get_local $l10))))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l1)
        (i32.const 16)))
    (f64.reinterpret/i64
      (get_local $l10)))
  (func $__divsi3 (export "__divsi3") (type $t6) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l0 i32) (local $l1 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (tee_local $l1
            (i32.sub
              (i32.xor
                (tee_local $l1
                  (i32.shr_s
                    (get_local $p1)
                    (i32.const 31)))
                (get_local $p1))
              (get_local $l1)))))
      (return
        (i32.sub
          (i32.xor
            (i32.div_u
              (i32.sub
                (i32.xor
                  (tee_local $l0
                    (i32.shr_s
                      (get_local $p0)
                      (i32.const 31)))
                  (get_local $p0))
                (get_local $l0))
              (get_local $l1))
            (tee_local $p1
              (i32.shr_s
                (i32.xor
                  (get_local $p1)
                  (get_local $p0))
                (i32.const 31))))
          (get_local $p1))))
    (unreachable)
    (unreachable))
  (func $__divdi3 (export "__divdi3") (type $t7) (param $p0 i64) (param $p1 i64) (result i64)
    (local $l0 i64) (local $l1 i64)
    (block $B0
      (br_if $B0
        (i64.eq
          (tee_local $l1
            (i64.sub
              (i64.xor
                (tee_local $l1
                  (i64.shr_s
                    (get_local $p1)
                    (i64.const 63)))
                (get_local $p1))
              (get_local $l1)))
          (i64.const 0)))
      (return
        (i64.sub
          (i64.xor
            (i64.div_u
              (i64.sub
                (i64.xor
                  (tee_local $l0
                    (i64.shr_s
                      (get_local $p0)
                      (i64.const 63)))
                  (get_local $p0))
                (get_local $l0))
              (get_local $l1))
            (tee_local $p1
              (i64.shr_s
                (i64.xor
                  (get_local $p1)
                  (get_local $p0))
                (i64.const 63))))
          (get_local $p1))))
    (unreachable)
    (unreachable))
  (func $__divti3 (export "__divti3") (type $t9) (param $p0 i32) (param $p1 i64) (param $p2 i64) (param $p3 i64) (param $p4 i64)
    (local $l0 i32) (local $l1 i64) (local $l2 i64)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l0
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 16))))
    (block $B0
      (br_if $B0
        (i64.eq
          (i64.or
            (tee_local $l1
              (i64.sub
                (tee_local $p3
                  (i64.xor
                    (tee_local $l2
                      (i64.shr_s
                        (get_local $p4)
                        (i64.const 63)))
                    (get_local $p3)))
                (get_local $l2)))
            (tee_local $p3
              (i64.sub
                (i64.sub
                  (i64.xor
                    (get_local $l2)
                    (get_local $p4))
                  (get_local $l2))
                (i64.extend_u/i32
                  (i64.lt_u
                    (get_local $p3)
                    (get_local $l2))))))
          (i64.const 0)))
      (call $__udivti3
        (get_local $l0)
        (i64.sub
          (tee_local $p1
            (i64.xor
              (tee_local $l2
                (i64.shr_s
                  (get_local $p2)
                  (i64.const 63)))
              (get_local $p1)))
          (get_local $l2))
        (i64.sub
          (i64.sub
            (i64.xor
              (get_local $l2)
              (get_local $p2))
            (get_local $l2))
          (i64.extend_u/i32
            (i64.lt_u
              (get_local $p1)
              (get_local $l2))))
        (get_local $l1)
        (get_local $p3))
      (i64.store
        (get_local $p0)
        (i64.sub
          (tee_local $p4
            (i64.xor
              (i64.load
                (get_local $l0))
              (tee_local $l2
                (i64.shr_s
                  (i64.xor
                    (get_local $p4)
                    (get_local $p2))
                  (i64.const 63)))))
          (get_local $l2)))
      (i64.store
        (i32.add
          (get_local $p0)
          (i32.const 8))
        (i64.sub
          (i64.sub
            (i64.xor
              (i64.load
                (i32.add
                  (get_local $l0)
                  (i32.const 8)))
              (get_local $l2))
            (get_local $l2))
          (i64.extend_u/i32
            (i64.lt_u
              (get_local $p4)
              (get_local $l2)))))
      (i32.store offset=4
        (i32.const 0)
        (i32.add
          (get_local $l0)
          (i32.const 16)))
      (return))
    (unreachable)
    (unreachable))
  (func $__modsi3 (export "__modsi3") (type $t6) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l0 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (tee_local $l0
            (i32.sub
              (i32.xor
                (tee_local $l0
                  (i32.shr_s
                    (get_local $p1)
                    (i32.const 31)))
                (get_local $p1))
              (get_local $l0)))))
      (return
        (i32.sub
          (i32.xor
            (i32.rem_u
              (i32.sub
                (i32.xor
                  (tee_local $p1
                    (i32.shr_s
                      (get_local $p0)
                      (i32.const 31)))
                  (get_local $p0))
                (get_local $p1))
              (get_local $l0))
            (get_local $p1))
          (get_local $p1))))
    (unreachable)
    (unreachable))
  (func $__moddi3 (export "__moddi3") (type $t7) (param $p0 i64) (param $p1 i64) (result i64)
    (local $l0 i64)
    (block $B0
      (br_if $B0
        (i64.eq
          (tee_local $l0
            (i64.sub
              (i64.xor
                (tee_local $l0
                  (i64.shr_s
                    (get_local $p1)
                    (i64.const 63)))
                (get_local $p1))
              (get_local $l0)))
          (i64.const 0)))
      (return
        (i64.sub
          (i64.xor
            (i64.rem_u
              (i64.sub
                (i64.xor
                  (tee_local $p1
                    (i64.shr_s
                      (get_local $p0)
                      (i64.const 63)))
                  (get_local $p0))
                (get_local $p1))
              (get_local $l0))
            (get_local $p1))
          (get_local $p1))))
    (unreachable)
    (unreachable))
  (func $__modti3 (export "__modti3") (type $t9) (param $p0 i32) (param $p1 i64) (param $p2 i64) (param $p3 i64) (param $p4 i64)
    (local $l0 i32) (local $l1 i64) (local $l2 i64)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l0
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 16))))
    (block $B0
      (br_if $B0
        (i64.eq
          (i64.or
            (tee_local $l1
              (i64.sub
                (tee_local $p3
                  (i64.xor
                    (tee_local $l2
                      (i64.shr_s
                        (get_local $p4)
                        (i64.const 63)))
                    (get_local $p3)))
                (get_local $l2)))
            (tee_local $p4
              (i64.sub
                (i64.sub
                  (i64.xor
                    (get_local $l2)
                    (get_local $p4))
                  (get_local $l2))
                (i64.extend_u/i32
                  (i64.lt_u
                    (get_local $p3)
                    (get_local $l2))))))
          (i64.const 0)))
      (call $__umodti3
        (get_local $l0)
        (i64.sub
          (tee_local $p3
            (i64.xor
              (tee_local $l2
                (i64.shr_s
                  (get_local $p2)
                  (i64.const 63)))
              (get_local $p1)))
          (get_local $l2))
        (i64.sub
          (i64.sub
            (i64.xor
              (get_local $l2)
              (get_local $p2))
            (get_local $l2))
          (i64.extend_u/i32
            (i64.lt_u
              (get_local $p3)
              (get_local $l2))))
        (get_local $l1)
        (get_local $p4))
      (i64.store
        (get_local $p0)
        (i64.sub
          (tee_local $p4
            (i64.xor
              (i64.load
                (get_local $l0))
              (get_local $l2)))
          (get_local $l2)))
      (i64.store
        (i32.add
          (get_local $p0)
          (i32.const 8))
        (i64.sub
          (i64.sub
            (i64.xor
              (i64.load
                (i32.add
                  (get_local $l0)
                  (i32.const 8)))
              (get_local $l2))
            (get_local $l2))
          (i64.extend_u/i32
            (i64.lt_u
              (get_local $p4)
              (get_local $l2)))))
      (i32.store offset=4
        (i32.const 0)
        (i32.add
          (get_local $l0)
          (i32.const 16)))
      (return))
    (unreachable)
    (unreachable))
  (func $__divmodsi4 (export "__divmodsi4") (type $t3) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l0 i32) (local $l1 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (tee_local $l1
            (i32.sub
              (i32.xor
                (tee_local $l1
                  (i32.shr_s
                    (get_local $p1)
                    (i32.const 31)))
                (get_local $p1))
              (get_local $l1)))))
      (i32.store
        (get_local $p2)
        (i32.sub
          (get_local $p0)
          (i32.mul
            (tee_local $l1
              (i32.sub
                (i32.xor
                  (i32.div_u
                    (i32.sub
                      (i32.xor
                        (tee_local $l0
                          (i32.shr_s
                            (get_local $p0)
                            (i32.const 31)))
                        (get_local $p0))
                      (get_local $l0))
                    (get_local $l1))
                  (tee_local $l1
                    (i32.shr_s
                      (i32.xor
                        (get_local $p1)
                        (get_local $p0))
                      (i32.const 31))))
                (get_local $l1)))
            (get_local $p1))))
      (return
        (get_local $l1)))
    (unreachable)
    (unreachable))
  (func $__divmoddi4 (export "__divmoddi4") (type $t8) (param $p0 i64) (param $p1 i64) (param $p2 i32) (result i64)
    (local $l0 i64) (local $l1 i64)
    (block $B0
      (br_if $B0
        (i64.eq
          (tee_local $l1
            (i64.sub
              (i64.xor
                (tee_local $l1
                  (i64.shr_s
                    (get_local $p1)
                    (i64.const 63)))
                (get_local $p1))
              (get_local $l1)))
          (i64.const 0)))
      (i64.store
        (get_local $p2)
        (i64.sub
          (get_local $p0)
          (i64.mul
            (tee_local $l1
              (i64.sub
                (i64.xor
                  (i64.div_u
                    (i64.sub
                      (i64.xor
                        (tee_local $l0
                          (i64.shr_s
                            (get_local $p0)
                            (i64.const 63)))
                        (get_local $p0))
                      (get_local $l0))
                    (get_local $l1))
                  (tee_local $l1
                    (i64.shr_s
                      (i64.xor
                        (get_local $p1)
                        (get_local $p0))
                      (i64.const 63))))
                (get_local $l1)))
            (get_local $p1))))
      (return
        (get_local $l1)))
    (unreachable)
    (unreachable))
  (func $__divsf3 (export "__divsf3") (type $t4) (param $p0 f32) (param $p1 f32) (result f32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i64) (local $l11 i64)
    (set_local $l5
      (i32.and
        (tee_local $l1
          (i32.reinterpret/f32
            (get_local $p1)))
        (i32.const 8388607)))
    (set_local $l4
      (i32.and
        (tee_local $l0
          (i32.reinterpret/f32
            (get_local $p0)))
        (i32.const 8388607)))
    (set_local $l9
      (i32.and
        (i32.xor
          (get_local $l1)
          (get_local $l0))
        (i32.const -2147483648)))
    (set_local $l3
      (i32.and
        (i32.shr_u
          (get_local $l1)
          (i32.const 23))
        (i32.const 255)))
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.gt_u
              (i32.add
                (tee_local $l2
                  (i32.and
                    (i32.shr_u
                      (get_local $l0)
                      (i32.const 23))
                    (i32.const 255)))
                (i32.const -1))
              (i32.const 253)))
          (set_local $l8
            (i32.const 0))
          (br_if $B1
            (i32.lt_u
              (i32.add
                (get_local $l3)
                (i32.const -1))
              (i32.const 254))))
        (block $B3
          (br_if $B3
            (i32.lt_u
              (tee_local $l6
                (i32.and
                  (get_local $l0)
                  (i32.const 2147483647)))
              (i32.const 2139095041)))
          (return
            (f32.reinterpret/i32
              (i32.or
                (get_local $l0)
                (i32.const 4194304)))))
        (block $B4
          (br_if $B4
            (i32.lt_u
              (tee_local $l7
                (i32.and
                  (get_local $l1)
                  (i32.const 2147483647)))
              (i32.const 2139095041)))
          (return
            (f32.reinterpret/i32
              (i32.or
                (get_local $l1)
                (i32.const 4194304)))))
        (block $B5
          (br_if $B5
            (i32.ne
              (get_local $l6)
              (i32.const 2139095040)))
          (return
            (f32.reinterpret/i32
              (select
                (i32.const 2143289344)
                (i32.xor
                  (i32.and
                    (get_local $l1)
                    (i32.const -2147483648))
                  (get_local $l0))
                (i32.eq
                  (get_local $l7)
                  (i32.const 2139095040))))))
        (br_if $B0
          (i32.eq
            (get_local $l7)
            (i32.const 2139095040)))
        (block $B6
          (block $B7
            (br_if $B7
              (i32.eqz
                (get_local $l6)))
            (br_if $B6
              (i32.eqz
                (get_local $l7)))
            (set_local $l8
              (i32.const 0))
            (block $B8
              (br_if $B8
                (i32.gt_u
                  (get_local $l6)
                  (i32.const 8388607)))
              (set_local $l8
                (i32.sub
                  (i32.const 9)
                  (tee_local $l0
                    (i32.clz
                      (get_local $l4)))))
              (set_local $l4
                (i32.shl
                  (get_local $l4)
                  (i32.and
                    (i32.add
                      (get_local $l0)
                      (i32.const 24))
                    (i32.const 31)))))
            (br_if $B1
              (i32.gt_u
                (get_local $l7)
                (i32.const 8388607)))
            (set_local $l8
              (i32.add
                (i32.add
                  (get_local $l8)
                  (tee_local $l0
                    (i32.clz
                      (get_local $l5))))
                (i32.const -9)))
            (set_local $l5
              (i32.shl
                (get_local $l5)
                (i32.and
                  (i32.add
                    (get_local $l0)
                    (i32.const 24))
                  (i32.const 31))))
            (br $B1))
          (return
            (f32.reinterpret/i32
              (select
                (get_local $l9)
                (i32.const 2143289344)
                (get_local $l7)))))
        (return
          (f32.reinterpret/i32
            (i32.or
              (get_local $l9)
              (i32.const 2139095040)))))
      (block $B9
        (br_if $B9
          (i32.lt_s
            (tee_local $l0
              (i32.add
                (i32.sub
                  (i32.add
                    (i32.add
                      (get_local $l8)
                      (get_local $l2))
                    (i32.const 127))
                  (get_local $l3))
                (select
                  (i32.const -1)
                  (i32.const 0)
                  (tee_local $l4
                    (i32.lt_u
                      (tee_local $l3
                        (i32.wrap/i64
                          (i64.shr_u
                            (i64.mul
                              (i64.and
                                (i64.add
                                  (i64.shr_u
                                    (i64.mul
                                      (i64.and
                                        (i64.sub
                                          (i64.const 0)
                                          (i64.shr_u
                                            (i64.mul
                                              (tee_local $l11
                                                (i64.and
                                                  (i64.shr_u
                                                    (i64.mul
                                                      (i64.and
                                                        (i64.sub
                                                          (i64.const 0)
                                                          (i64.shr_u
                                                            (i64.mul
                                                              (tee_local $l11
                                                                (i64.and
                                                                  (i64.shr_u
                                                                    (i64.mul
                                                                      (i64.and
                                                                        (i64.sub
                                                                          (i64.const 0)
                                                                          (i64.shr_u
                                                                            (i64.mul
                                                                              (tee_local $l11
                                                                                (i64.extend_u/i32
                                                                                  (i32.sub
                                                                                    (i32.const 1963258675)
                                                                                    (tee_local $l0
                                                                                      (i32.shl
                                                                                        (tee_local $l1
                                                                                          (i32.or
                                                                                            (get_local $l5)
                                                                                            (i32.const 8388608)))
                                                                                        (i32.const 8))))))
                                                                              (tee_local $l10
                                                                                (i64.extend_u/i32
                                                                                  (get_local $l0))))
                                                                            (i64.const 32)))
                                                                        (i64.const 4294967295))
                                                                      (get_local $l11))
                                                                    (i64.const 31))
                                                                  (i64.const 4294967295)))
                                                              (get_local $l10))
                                                            (i64.const 32)))
                                                        (i64.const 4294967295))
                                                      (get_local $l11))
                                                    (i64.const 31))
                                                  (i64.const 4294967295)))
                                              (get_local $l10))
                                            (i64.const 32)))
                                        (i64.const 4294967295))
                                      (get_local $l11))
                                    (i64.const 31))
                                  (i64.const 4294967294))
                                (i64.const 4294967295))
                              (i64.extend_u/i32
                                (i32.shl
                                  (tee_local $l5
                                    (i32.or
                                      (get_local $l4)
                                      (i32.const 8388608)))
                                  (i32.const 1))))
                            (i64.const 32))))
                      (i32.const 16777216))))))
            (i32.const 255)))
        (return
          (f32.reinterpret/i32
            (i32.or
              (get_local $l9)
              (i32.const 2139095040)))))
      (br_if $B0
        (i32.lt_s
          (get_local $l0)
          (i32.const 1)))
      (set_local $l9
        (i32.or
          (i32.add
            (i32.gt_u
              (i32.shl
                (i32.sub
                  (i32.shl
                    (get_local $l5)
                    (select
                      (i32.const 24)
                      (i32.const 23)
                      (get_local $l4)))
                  (i32.mul
                    (get_local $l1)
                    (tee_local $l3
                      (i32.shr_u
                        (get_local $l3)
                        (i32.gt_u
                          (get_local $l3)
                          (i32.const 16777215))))))
                (i32.const 1))
              (get_local $l1))
            (i32.or
              (i32.shl
                (get_local $l0)
                (i32.const 23))
              (i32.and
                (get_local $l3)
                (i32.const 8388607))))
          (get_local $l9))))
    (f32.reinterpret/i32
      (get_local $l9)))
  (func $__divdf3 (export "__divdf3") (type $t5) (param $p0 f64) (param $p1 f64) (result f64)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i64) (local $l4 i64) (local $l5 i64) (local $l6 i64) (local $l7 i64) (local $l8 i64) (local $l9 i64) (local $l10 i64) (local $l11 i64)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l2
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 16))))
    (set_local $l8
      (i64.and
        (tee_local $l4
          (i64.reinterpret/f64
            (get_local $p1)))
        (i64.const 4503599627370495)))
    (set_local $l7
      (i64.and
        (tee_local $l3
          (i64.reinterpret/f64
            (get_local $p0)))
        (i64.const 4503599627370495)))
    (set_local $l11
      (i64.and
        (i64.xor
          (get_local $l4)
          (get_local $l3))
        (i64.const -9223372036854775808)))
    (set_local $l6
      (i64.and
        (i64.shr_u
          (get_local $l4)
          (i64.const 52))
        (i64.const 2047)))
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i64.gt_u
              (i64.add
                (tee_local $l5
                  (i64.and
                    (i64.shr_u
                      (get_local $l3)
                      (i64.const 52))
                    (i64.const 2047)))
                (i64.const -1))
              (i64.const 2045)))
          (set_local $l1
            (i32.const 0))
          (br_if $B1
            (i64.lt_u
              (i64.add
                (get_local $l6)
                (i64.const -1))
              (i64.const 2046))))
        (block $B3
          (br_if $B3
            (i64.lt_u
              (tee_local $l10
                (i64.and
                  (get_local $l3)
                  (i64.const 9223372036854775807)))
              (i64.const 9218868437227405313)))
          (set_local $l11
            (i64.or
              (get_local $l3)
              (i64.const 2251799813685248)))
          (br $B0))
        (block $B4
          (br_if $B4
            (i64.lt_u
              (tee_local $l9
                (i64.and
                  (get_local $l4)
                  (i64.const 9223372036854775807)))
              (i64.const 9218868437227405313)))
          (set_local $l11
            (i64.or
              (get_local $l4)
              (i64.const 2251799813685248)))
          (br $B0))
        (block $B5
          (br_if $B5
            (i64.ne
              (get_local $l10)
              (i64.const 9218868437227405312)))
          (set_local $l11
            (select
              (i64.const 9221120237041090560)
              (i64.xor
                (i64.and
                  (get_local $l4)
                  (i64.const -9223372036854775808))
                (get_local $l3))
              (i64.eq
                (get_local $l9)
                (i64.const 9218868437227405312))))
          (br $B0))
        (br_if $B0
          (i64.eq
            (get_local $l9)
            (i64.const 9218868437227405312)))
        (block $B6
          (block $B7
            (br_if $B7
              (i64.eq
                (get_local $l10)
                (i64.const 0)))
            (br_if $B6
              (i64.eq
                (get_local $l9)
                (i64.const 0)))
            (set_local $l1
              (i32.const 0))
            (block $B8
              (br_if $B8
                (i64.gt_u
                  (get_local $l10)
                  (i64.const 4503599627370495)))
              (set_local $l1
                (i32.sub
                  (i32.const 12)
                  (i32.wrap/i64
                    (tee_local $l3
                      (i64.clz
                        (get_local $l7))))))
              (set_local $l7
                (i64.shl
                  (get_local $l7)
                  (i64.and
                    (i64.add
                      (get_local $l3)
                      (i64.const 53))
                    (i64.const 63)))))
            (br_if $B1
              (i64.gt_u
                (get_local $l9)
                (i64.const 4503599627370495)))
            (set_local $l1
              (i32.add
                (i32.add
                  (get_local $l1)
                  (i32.wrap/i64
                    (tee_local $l3
                      (i64.clz
                        (get_local $l8)))))
                (i32.const -12)))
            (set_local $l8
              (i64.shl
                (get_local $l8)
                (i64.and
                  (i64.add
                    (get_local $l3)
                    (i64.const 53))
                  (i64.const 63))))
            (br $B1))
          (set_local $l11
            (select
              (i64.const 9221120237041090560)
              (get_local $l11)
              (i64.eqz
                (get_local $l9))))
          (br $B0))
        (set_local $l11
          (i64.or
            (get_local $l11)
            (i64.const 9218868437227405312)))
        (br $B0))
      (call $__multi3
        (get_local $l2)
        (i64.add
          (i64.add
            (i64.mul
              (i64.shr_u
                (tee_local $l3
                  (i64.sub
                    (i64.const 0)
                    (i64.add
                      (i64.mul
                        (tee_local $l4
                          (i64.and
                            (i64.add
                              (i64.shr_u
                                (i64.mul
                                  (i64.and
                                    (i64.sub
                                      (i64.const 0)
                                      (i64.shr_u
                                        (i64.mul
                                          (tee_local $l4
                                            (i64.and
                                              (i64.shr_u
                                                (i64.mul
                                                  (i64.and
                                                    (i64.sub
                                                      (i64.const 0)
                                                      (i64.shr_u
                                                        (i64.mul
                                                          (tee_local $l4
                                                            (i64.and
                                                              (i64.shr_u
                                                                (i64.mul
                                                                  (i64.and
                                                                    (i64.sub
                                                                      (i64.const 0)
                                                                      (i64.shr_u
                                                                        (i64.mul
                                                                          (tee_local $l4
                                                                            (i64.and
                                                                              (i64.sub
                                                                                (i64.const 1963258675)
                                                                                (tee_local $l3
                                                                                  (i64.shr_u
                                                                                    (tee_local $l10
                                                                                      (i64.or
                                                                                        (get_local $l8)
                                                                                        (i64.const 4503599627370496)))
                                                                                    (i64.const 21))))
                                                                              (i64.const 4294967295)))
                                                                          (tee_local $l3
                                                                            (i64.and
                                                                              (get_local $l3)
                                                                              (i64.const 4294967295))))
                                                                        (i64.const 32)))
                                                                    (i64.const 4294967295))
                                                                  (get_local $l4))
                                                                (i64.const 31))
                                                              (i64.const 4294967295)))
                                                          (get_local $l3))
                                                        (i64.const 32)))
                                                    (i64.const 4294967295))
                                                  (get_local $l4))
                                                (i64.const 31))
                                              (i64.const 4294967295)))
                                          (get_local $l3))
                                        (i64.const 32)))
                                    (i64.const 4294967295))
                                  (get_local $l4))
                                (i64.const 31))
                              (i64.const 4294967295))
                            (i64.const 4294967295)))
                        (get_local $l3))
                      (i64.shr_u
                        (i64.mul
                          (get_local $l4)
                          (i64.and
                            (i64.shl
                              (get_local $l8)
                              (i64.const 11))
                            (i64.const 4294965248)))
                        (i64.const 32)))))
                (i64.const 32))
              (get_local $l4))
            (i64.shr_u
              (i64.mul
                (i64.and
                  (get_local $l3)
                  (i64.const 4294967295))
                (get_local $l4))
              (i64.const 32)))
          (i64.const -2))
        (i64.const 0)
        (i64.shl
          (tee_local $l4
            (i64.or
              (get_local $l7)
              (i64.const 4503599627370496)))
          (i64.const 2))
        (i64.const 0))
      (block $B9
        (br_if $B9
          (i32.lt_s
            (tee_local $l1
              (i32.add
                (i32.sub
                  (i32.add
                    (i32.add
                      (get_local $l1)
                      (i32.wrap/i64
                        (get_local $l5)))
                    (i32.const 1023))
                  (i32.wrap/i64
                    (get_local $l6)))
                (select
                  (i32.const -1)
                  (i32.const 0)
                  (tee_local $l0
                    (i64.lt_u
                      (tee_local $l3
                        (i64.load
                          (i32.add
                            (get_local $l2)
                            (i32.const 8))))
                      (i64.const 9007199254740992))))))
            (i32.const 2047)))
        (set_local $l11
          (i64.or
            (get_local $l11)
            (i64.const 9218868437227405312)))
        (br $B0))
      (br_if $B0
        (i32.lt_s
          (get_local $l1)
          (i32.const 1)))
      (set_local $l11
        (i64.or
          (i64.add
            (i64.extend_u/i32
              (i64.gt_u
                (i64.shl
                  (i64.sub
                    (i64.shl
                      (get_local $l4)
                      (select
                        (i64.const 53)
                        (i64.const 52)
                        (get_local $l0)))
                    (i64.mul
                      (get_local $l10)
                      (tee_local $l3
                        (i64.shr_u
                          (get_local $l3)
                          (i64.extend_u/i32
                            (i64.gt_u
                              (get_local $l3)
                              (i64.const 9007199254740991)))))))
                  (i64.const 1))
                (get_local $l10)))
            (i64.or
              (i64.shl
                (i64.extend_u/i32
                  (get_local $l1))
                (i64.const 52))
              (i64.and
                (get_local $l3)
                (i64.const 4503599627370495))))
          (get_local $l11))))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l2)
        (i32.const 16)))
    (f64.reinterpret/i64
      (get_local $l11)))
  (func $__ashldi3 (export "__ashldi3") (type $t13) (param $p0 i64) (param $p1 i32) (result i64)
    (local $l0 i32)
    (block $B0
      (br_if $B0
        (i32.and
          (get_local $p1)
          (i32.const 32)))
      (block $B1
        (br_if $B1
          (i32.eqz
            (get_local $p1)))
        (set_local $p0
          (i64.or
            (i64.shl
              (i64.extend_u/i32
                (i32.or
                  (i32.shr_u
                    (tee_local $l0
                      (i32.wrap/i64
                        (get_local $p0)))
                    (i32.and
                      (i32.sub
                        (i32.const 0)
                        (get_local $p1))
                      (i32.const 31)))
                  (i32.shl
                    (i32.wrap/i64
                      (i64.shr_u
                        (get_local $p0)
                        (i64.const 32)))
                    (tee_local $p1
                      (i32.and
                        (get_local $p1)
                        (i32.const 31))))))
              (i64.const 32))
            (i64.extend_u/i32
              (i32.shl
                (get_local $l0)
                (get_local $p1))))))
      (return
        (get_local $p0)))
    (i64.shl
      (i64.extend_u/i32
        (i32.shl
          (i32.wrap/i64
            (get_local $p0))
          (i32.and
            (get_local $p1)
            (i32.const 31))))
      (i64.const 32)))
  (func $__ashlti3 (export "__ashlti3") (type $t14) (param $p0 i32) (param $p1 i64) (param $p2 i64) (param $p3 i32)
    (local $l0 i64)
    (block $B0
      (block $B1
        (br_if $B1
          (i32.and
            (get_local $p3)
            (i32.const 64)))
        (br_if $B0
          (i32.eqz
            (get_local $p3)))
        (set_local $p2
          (i64.or
            (i64.shr_u
              (get_local $p1)
              (i64.extend_u/i32
                (i32.and
                  (i32.sub
                    (i32.const 0)
                    (get_local $p3))
                  (i32.const 63))))
            (i64.shl
              (get_local $p2)
              (tee_local $l0
                (i64.extend_u/i32
                  (i32.and
                    (get_local $p3)
                    (i32.const 63)))))))
        (set_local $p1
          (i64.shl
            (get_local $p1)
            (get_local $l0)))
        (br $B0))
      (set_local $p2
        (i64.shl
          (get_local $p1)
          (i64.extend_u/i32
            (i32.and
              (get_local $p3)
              (i32.const 63)))))
      (set_local $p1
        (i64.const 0)))
    (i64.store
      (get_local $p0)
      (get_local $p1))
    (i64.store
      (i32.add
        (get_local $p0)
        (i32.const 8))
      (get_local $p2)))
  (func $__ashrdi3 (export "__ashrdi3") (type $t13) (param $p0 i64) (param $p1 i32) (result i64)
    (local $l0 i32) (local $l1 i32)
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.and
              (get_local $p1)
              (i32.const 32)))
          (br_if $B0
            (i32.eqz
              (get_local $p1)))
          (set_local $p1
            (i32.or
              (i32.shr_u
                (i32.wrap/i64
                  (get_local $p0))
                (tee_local $l1
                  (i32.and
                    (get_local $p1)
                    (i32.const 31))))
              (i32.shl
                (tee_local $l0
                  (i32.wrap/i64
                    (i64.shr_u
                      (get_local $p0)
                      (i64.const 32))))
                (i32.and
                  (i32.sub
                    (i32.const 0)
                    (get_local $p1))
                  (i32.const 31)))))
          (br $B1))
        (set_local $l1
          (i32.const 31))
        (set_local $p1
          (i32.shr_s
            (tee_local $l0
              (i32.wrap/i64
                (i64.shr_u
                  (get_local $p0)
                  (i64.const 32))))
            (i32.and
              (get_local $p1)
              (i32.const 31)))))
      (set_local $p0
        (i64.or
          (i64.shl
            (i64.extend_u/i32
              (i32.shr_s
                (get_local $l0)
                (get_local $l1)))
            (i64.const 32))
          (i64.extend_u/i32
            (get_local $p1)))))
    (get_local $p0))
  (func $__ashrti3 (export "__ashrti3") (type $t14) (param $p0 i32) (param $p1 i64) (param $p2 i64) (param $p3 i32)
    (local $l0 i64)
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.and
              (get_local $p3)
              (i32.const 64)))
          (br_if $B0
            (i32.eqz
              (get_local $p3)))
          (set_local $p1
            (i64.or
              (i64.shr_u
                (get_local $p1)
                (tee_local $l0
                  (i64.extend_u/i32
                    (i32.and
                      (get_local $p3)
                      (i32.const 63)))))
              (i64.shl
                (get_local $p2)
                (i64.extend_u/i32
                  (i32.and
                    (i32.sub
                      (i32.const 0)
                      (get_local $p3))
                    (i32.const 63))))))
          (br $B1))
        (set_local $p1
          (i64.shr_s
            (get_local $p2)
            (i64.extend_u/i32
              (i32.and
                (get_local $p3)
                (i32.const 63)))))
        (set_local $l0
          (i64.const 63)))
      (set_local $p2
        (i64.shr_s
          (get_local $p2)
          (get_local $l0))))
    (i64.store
      (get_local $p0)
      (get_local $p1))
    (i64.store
      (i32.add
        (get_local $p0)
        (i32.const 8))
      (get_local $p2)))
  (func $__lshrdi3 (export "__lshrdi3") (type $t13) (param $p0 i64) (param $p1 i32) (result i64)
    (local $l0 i32) (local $l1 i32)
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.and
              (get_local $p1)
              (i32.const 32)))
          (br_if $B0
            (i32.eqz
              (get_local $p1)))
          (set_local $p1
            (i32.or
              (i32.shr_u
                (i32.wrap/i64
                  (get_local $p0))
                (tee_local $l1
                  (i32.and
                    (get_local $p1)
                    (i32.const 31))))
              (i32.shl
                (tee_local $l0
                  (i32.wrap/i64
                    (i64.shr_u
                      (get_local $p0)
                      (i64.const 32))))
                (i32.and
                  (i32.sub
                    (i32.const 0)
                    (get_local $p1))
                  (i32.const 31)))))
          (set_local $p0
            (i64.shl
              (i64.extend_u/i32
                (i32.shr_u
                  (get_local $l0)
                  (get_local $l1)))
              (i64.const 32)))
          (br $B1))
        (set_local $p1
          (i32.shr_u
            (i32.wrap/i64
              (i64.shr_u
                (get_local $p0)
                (i64.const 32)))
            (i32.and
              (get_local $p1)
              (i32.const 31))))
        (set_local $p0
          (i64.const 0)))
      (set_local $p0
        (i64.or
          (get_local $p0)
          (i64.extend_u/i32
            (get_local $p1)))))
    (get_local $p0))
  (func $__lshrti3 (export "__lshrti3") (type $t14) (param $p0 i32) (param $p1 i64) (param $p2 i64) (param $p3 i32)
    (local $l0 i64)
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.and
              (get_local $p3)
              (i32.const 64)))
          (br_if $B0
            (i32.eqz
              (get_local $p3)))
          (set_local $p1
            (i64.or
              (i64.shr_u
                (get_local $p1)
                (tee_local $l0
                  (i64.extend_u/i32
                    (i32.and
                      (get_local $p3)
                      (i32.const 63)))))
              (i64.shl
                (get_local $p2)
                (i64.extend_u/i32
                  (i32.and
                    (i32.sub
                      (i32.const 0)
                      (get_local $p3))
                    (i32.const 63))))))
          (set_local $p2
            (i64.shr_u
              (get_local $p2)
              (get_local $l0)))
          (set_local $l0
            (i64.const 0))
          (br $B1))
        (set_local $p1
          (i64.shr_u
            (get_local $p2)
            (i64.extend_u/i32
              (i32.and
                (get_local $p3)
                (i32.const 63)))))
        (set_local $l0
          (i64.const 0))
        (set_local $p2
          (i64.const 0)))
      (set_local $p1
        (i64.or
          (get_local $l0)
          (get_local $p1))))
    (i64.store
      (get_local $p0)
      (get_local $p1))
    (i64.store
      (i32.add
        (get_local $p0)
        (i32.const 8))
      (get_local $p2)))
  (func $__floatsisf (export "__floatsisf") (type $t15) (param $p0 i32) (result f32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32)
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (block $B4
              (br_if $B4
                (i32.eqz
                  (get_local $p0)))
              (set_local $l3
                (i32.sub
                  (i32.const 31)
                  (tee_local $l1
                    (i32.clz
                      (tee_local $l0
                        (i32.xor
                          (i32.add
                            (get_local $p0)
                            (tee_local $l0
                              (i32.shr_s
                                (get_local $p0)
                                (i32.const 31))))
                          (get_local $l0)))))))
              (br_if $B3
                (i32.le_u
                  (tee_local $l1
                    (i32.sub
                      (i32.const 32)
                      (get_local $l1)))
                  (i32.const 24)))
              (br_if $B2
                (i32.eq
                  (get_local $l1)
                  (i32.const 25)))
              (br_if $B1
                (i32.eq
                  (get_local $l1)
                  (i32.const 26)))
              (set_local $l0
                (i32.or
                  (i32.ne
                    (i32.shl
                      (get_local $l0)
                      (i32.and
                        (i32.sub
                          (i32.const 58)
                          (get_local $l1))
                        (i32.const 31)))
                    (i32.const 0))
                  (i32.shr_u
                    (get_local $l0)
                    (i32.and
                      (i32.add
                        (get_local $l1)
                        (i32.const 6))
                      (i32.const 31)))))
              (br $B1))
            (return
              (f32.const 0x0p+0 (;=0;))))
          (set_local $l0
            (i32.shl
              (get_local $l0)
              (i32.and
                (i32.sub
                  (i32.const 24)
                  (get_local $l1))
                (i32.const 31))))
          (br $B0))
        (set_local $l0
          (i32.shl
            (get_local $l0)
            (i32.const 1))))
      (set_local $l0
        (select
          (i32.shr_u
            (tee_local $l0
              (i32.add
                (i32.or
                  (i32.and
                    (i32.shr_u
                      (get_local $l0)
                      (i32.const 2))
                    (i32.const 1))
                  (get_local $l0))
                (i32.const 1)))
            (i32.const 3))
          (tee_local $l0
            (i32.shr_u
              (get_local $l0)
              (i32.const 2)))
          (tee_local $l2
            (i32.and
              (get_local $l0)
              (i32.const 16777216)))))
      (set_local $l3
        (select
          (get_local $l1)
          (get_local $l3)
          (get_local $l2))))
    (f32.reinterpret/i32
      (i32.or
        (i32.or
          (i32.and
            (i32.add
              (i32.shl
                (get_local $l3)
                (i32.const 23))
              (i32.const 1065353216))
            (i32.const 2139095040))
          (i32.and
            (get_local $p0)
            (i32.const -2147483648)))
        (i32.and
          (get_local $l0)
          (i32.const 8388607)))))
  (func $__floatsidf (export "__floatsidf") (type $t16) (param $p0 i32) (result f64)
    (local $l0 i32) (local $l1 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (get_local $p0)))
      (return
        (f64.reinterpret/i64
          (i64.or
            (i64.or
              (i64.shl
                (i64.extend_u/i32
                  (i32.sub
                    (i32.const 1054)
                    (tee_local $l1
                      (i32.clz
                        (tee_local $l0
                          (i32.xor
                            (i32.add
                              (get_local $p0)
                              (tee_local $l0
                                (i32.shr_s
                                  (get_local $p0)
                                  (i32.const 31))))
                            (get_local $l0)))))))
                (i64.const 52))
              (i64.shl
                (i64.extend_u/i32
                  (i32.shr_u
                    (get_local $p0)
                    (i32.const 31)))
                (i64.const 63)))
            (i64.and
              (i64.shl
                (i64.extend_u/i32
                  (get_local $l0))
                (i64.extend_u/i32
                  (i32.and
                    (i32.sub
                      (i32.const 117)
                      (i32.sub
                        (i32.const 32)
                        (get_local $l1)))
                    (i32.const 63))))
              (i64.const 4503599627370495))))))
    (f64.const 0x0p+0 (;=0;)))
  (func $__floatdidf (export "__floatdidf") (type $t17) (param $p0 i64) (result f64)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i64) (local $l4 i64)
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (block $B4
              (br_if $B4
                (i64.eqz
                  (get_local $p0)))
              (set_local $l2
                (i32.sub
                  (i32.const 63)
                  (tee_local $l0
                    (i32.wrap/i64
                      (i64.clz
                        (tee_local $l3
                          (i64.xor
                            (i64.add
                              (get_local $p0)
                              (tee_local $l3
                                (i64.shr_s
                                  (get_local $p0)
                                  (i64.const 63))))
                            (get_local $l3))))))))
              (br_if $B3
                (i32.le_u
                  (tee_local $l0
                    (i32.sub
                      (i32.const 64)
                      (get_local $l0)))
                  (i32.const 53)))
              (br_if $B2
                (i32.eq
                  (get_local $l0)
                  (i32.const 54)))
              (br_if $B1
                (i32.eq
                  (get_local $l0)
                  (i32.const 55)))
              (set_local $l3
                (i64.or
                  (i64.extend_u/i32
                    (i64.ne
                      (i64.shl
                        (get_local $l3)
                        (i64.extend_u/i32
                          (i32.and
                            (i32.sub
                              (i32.const 119)
                              (get_local $l0))
                            (i32.const 63))))
                      (i64.const 0)))
                  (i64.shr_u
                    (get_local $l3)
                    (i64.extend_u/i32
                      (i32.and
                        (i32.add
                          (get_local $l0)
                          (i32.const 9))
                        (i32.const 63))))))
              (br $B1))
            (return
              (f64.const 0x0p+0 (;=0;))))
          (set_local $l3
            (i64.shl
              (get_local $l3)
              (i64.extend_u/i32
                (i32.and
                  (i32.sub
                    (i32.const 53)
                    (get_local $l0))
                  (i32.const 63)))))
          (br $B0))
        (set_local $l3
          (i64.shl
            (get_local $l3)
            (i64.const 1))))
      (set_local $l3
        (select
          (tee_local $l4
            (i64.shr_u
              (tee_local $l3
                (i64.add
                  (i64.or
                    (i64.and
                      (i64.shr_u
                        (get_local $l3)
                        (i64.const 2))
                      (i64.const 1))
                    (get_local $l3))
                  (i64.const 1)))
              (i64.const 2)))
          (i64.shr_u
            (get_local $l3)
            (i64.const 3))
          (tee_local $l1
            (i64.eqz
              (i64.and
                (get_local $l4)
                (i64.const 9007199254740992))))))
      (set_local $l2
        (select
          (get_local $l2)
          (get_local $l0)
          (get_local $l1))))
    (f64.reinterpret/i64
      (i64.or
        (i64.or
          (i64.and
            (i64.shl
              (i64.extend_u/i32
                (i32.add
                  (get_local $l2)
                  (i32.const 1023)))
              (i64.const 52))
            (i64.const 9218868437227405312))
          (i64.and
            (get_local $p0)
            (i64.const -9223372036854775808)))
        (i64.and
          (get_local $l3)
          (i64.const 4503599627370495)))))
  (func $__floattisf (export "__floattisf") (type $t18) (param $p0 i64) (param $p1 i64) (result f32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i64) (local $l5 i64) (local $l6 f32)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l3
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 48))))
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (block $B4
              (block $B5
                (br_if $B5
                  (i64.eqz
                    (i64.or
                      (get_local $p0)
                      (get_local $p1))))
                (set_local $l2
                  (i32.sub
                    (i32.const 127)
                    (tee_local $l0
                      (i32.wrap/i64
                        (select
                          (i64.clz
                            (tee_local $p0
                              (i64.xor
                                (i64.add
                                  (i64.add
                                    (get_local $p1)
                                    (tee_local $l4
                                      (i64.shr_s
                                        (get_local $p1)
                                        (i64.const 63))))
                                  (select
                                    (i64.const 1)
                                    (i64.extend_u/i32
                                      (i64.lt_u
                                        (tee_local $l5
                                          (i64.add
                                            (get_local $p0)
                                            (get_local $l4)))
                                        (get_local $p0)))
                                    (i64.lt_u
                                      (get_local $l5)
                                      (get_local $l4))))
                                (get_local $l4))))
                          (i64.add
                            (i64.clz
                              (tee_local $l4
                                (i64.xor
                                  (get_local $l5)
                                  (get_local $l4))))
                            (i64.const 64))
                          (i64.ne
                            (get_local $p0)
                            (i64.const 0)))))))
                (br_if $B4
                  (i32.le_u
                    (tee_local $l0
                      (i32.sub
                        (i32.const 128)
                        (get_local $l0)))
                    (i32.const 24)))
                (br_if $B3
                  (i32.eq
                    (get_local $l0)
                    (i32.const 25)))
                (br_if $B2
                  (i32.eq
                    (get_local $l0)
                    (i32.const 26)))
                (call $__ashlti3
                  (get_local $l3)
                  (get_local $l4)
                  (get_local $p0)
                  (i32.and
                    (i32.sub
                      (i32.const 154)
                      (get_local $l0))
                    (i32.const 127)))
                (call $__lshrti3
                  (i32.add
                    (get_local $l3)
                    (i32.const 16))
                  (get_local $l4)
                  (get_local $p0)
                  (i32.and
                    (i32.add
                      (get_local $l0)
                      (i32.const 102))
                    (i32.const 127)))
                (set_local $l4
                  (i64.or
                    (i64.extend_u/i32
                      (i64.ne
                        (i64.or
                          (i64.load
                            (get_local $l3))
                          (i64.load
                            (i32.add
                              (get_local $l3)
                              (i32.const 8))))
                        (i64.const 0)))
                    (i64.load offset=16
                      (get_local $l3))))
                (set_local $p0
                  (i64.load
                    (i32.add
                      (i32.add
                        (get_local $l3)
                        (i32.const 16))
                      (i32.const 8))))
                (br $B2))
              (set_local $l6
                (f32.const 0x0p+0 (;=0;)))
              (br $B0))
            (call $__ashlti3
              (i32.add
                (get_local $l3)
                (i32.const 32))
              (get_local $l4)
              (get_local $p0)
              (i32.and
                (i32.sub
                  (i32.const 24)
                  (get_local $l0))
                (i32.const 127)))
            (set_local $p0
              (i64.load offset=32
                (get_local $l3)))
            (br $B1))
          (set_local $p0
            (i64.or
              (i64.shl
                (get_local $p0)
                (i64.const 1))
              (i64.shr_u
                (get_local $l4)
                (i64.const 63))))
          (set_local $l4
            (i64.shl
              (get_local $l4)
              (i64.const 1))))
        (set_local $p0
          (select
            (tee_local $l5
              (i64.or
                (i64.shr_u
                  (tee_local $l4
                    (i64.add
                      (tee_local $l5
                        (i64.or
                          (i64.and
                            (i64.shr_u
                              (get_local $l4)
                              (i64.const 2))
                            (i64.const 1))
                          (get_local $l4)))
                      (i64.const 1)))
                  (i64.const 2))
                (i64.shl
                  (tee_local $p0
                    (i64.add
                      (get_local $p0)
                      (select
                        (i64.const 1)
                        (i64.extend_u/i32
                          (i64.lt_u
                            (get_local $l4)
                            (get_local $l5)))
                        (i64.eqz
                          (get_local $l4)))))
                  (i64.const 62))))
            (i64.or
              (i64.shr_u
                (get_local $l4)
                (i64.const 3))
              (i64.shl
                (get_local $p0)
                (i64.const 61)))
            (tee_local $l1
              (i64.eqz
                (i64.and
                  (get_local $l5)
                  (i64.const 16777216))))))
        (set_local $l2
          (select
            (get_local $l2)
            (get_local $l0)
            (get_local $l1))))
      (set_local $l6
        (f32.reinterpret/i32
          (i32.or
            (i32.or
              (i32.and
                (i32.add
                  (i32.shl
                    (get_local $l2)
                    (i32.const 23))
                  (i32.const 1065353216))
                (i32.const 2139095040))
              (i32.and
                (i32.wrap/i64
                  (i64.shr_u
                    (get_local $p1)
                    (i64.const 32)))
                (i32.const -2147483648)))
            (i32.and
              (i32.wrap/i64
                (get_local $p0))
              (i32.const 8388607))))))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l3)
        (i32.const 48)))
    (get_local $l6))
  (func $__floattidf (export "__floattidf") (type $t19) (param $p0 i64) (param $p1 i64) (result f64)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i64) (local $l5 i64) (local $l6 f64)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l3
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 48))))
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (block $B4
              (block $B5
                (br_if $B5
                  (i64.eqz
                    (i64.or
                      (get_local $p0)
                      (get_local $p1))))
                (set_local $l2
                  (i32.sub
                    (i32.const 127)
                    (tee_local $l0
                      (i32.wrap/i64
                        (select
                          (i64.clz
                            (tee_local $p0
                              (i64.xor
                                (i64.add
                                  (i64.add
                                    (get_local $p1)
                                    (tee_local $l4
                                      (i64.shr_s
                                        (get_local $p1)
                                        (i64.const 63))))
                                  (select
                                    (i64.const 1)
                                    (i64.extend_u/i32
                                      (i64.lt_u
                                        (tee_local $l5
                                          (i64.add
                                            (get_local $p0)
                                            (get_local $l4)))
                                        (get_local $p0)))
                                    (i64.lt_u
                                      (get_local $l5)
                                      (get_local $l4))))
                                (get_local $l4))))
                          (i64.add
                            (i64.clz
                              (tee_local $l4
                                (i64.xor
                                  (get_local $l5)
                                  (get_local $l4))))
                            (i64.const 64))
                          (i64.ne
                            (get_local $p0)
                            (i64.const 0)))))))
                (br_if $B4
                  (i32.le_u
                    (tee_local $l0
                      (i32.sub
                        (i32.const 128)
                        (get_local $l0)))
                    (i32.const 53)))
                (br_if $B3
                  (i32.eq
                    (get_local $l0)
                    (i32.const 54)))
                (br_if $B2
                  (i32.eq
                    (get_local $l0)
                    (i32.const 55)))
                (call $__ashlti3
                  (get_local $l3)
                  (get_local $l4)
                  (get_local $p0)
                  (i32.and
                    (i32.sub
                      (i32.const 183)
                      (get_local $l0))
                    (i32.const 127)))
                (call $__lshrti3
                  (i32.add
                    (get_local $l3)
                    (i32.const 16))
                  (get_local $l4)
                  (get_local $p0)
                  (i32.and
                    (i32.add
                      (get_local $l0)
                      (i32.const 73))
                    (i32.const 127)))
                (set_local $l4
                  (i64.or
                    (i64.extend_u/i32
                      (i64.ne
                        (i64.or
                          (i64.load
                            (get_local $l3))
                          (i64.load
                            (i32.add
                              (get_local $l3)
                              (i32.const 8))))
                        (i64.const 0)))
                    (i64.load offset=16
                      (get_local $l3))))
                (set_local $p0
                  (i64.load
                    (i32.add
                      (i32.add
                        (get_local $l3)
                        (i32.const 16))
                      (i32.const 8))))
                (br $B2))
              (set_local $l6
                (f64.const 0x0p+0 (;=0;)))
              (br $B0))
            (call $__ashlti3
              (i32.add
                (get_local $l3)
                (i32.const 32))
              (get_local $l4)
              (get_local $p0)
              (i32.and
                (i32.sub
                  (i32.const 53)
                  (get_local $l0))
                (i32.const 127)))
            (set_local $p0
              (i64.load offset=32
                (get_local $l3)))
            (br $B1))
          (set_local $p0
            (i64.or
              (i64.shl
                (get_local $p0)
                (i64.const 1))
              (i64.shr_u
                (get_local $l4)
                (i64.const 63))))
          (set_local $l4
            (i64.shl
              (get_local $l4)
              (i64.const 1))))
        (set_local $p0
          (select
            (tee_local $l5
              (i64.or
                (i64.shr_u
                  (tee_local $l4
                    (i64.add
                      (tee_local $l5
                        (i64.or
                          (i64.and
                            (i64.shr_u
                              (get_local $l4)
                              (i64.const 2))
                            (i64.const 1))
                          (get_local $l4)))
                      (i64.const 1)))
                  (i64.const 2))
                (i64.shl
                  (tee_local $p0
                    (i64.add
                      (get_local $p0)
                      (select
                        (i64.const 1)
                        (i64.extend_u/i32
                          (i64.lt_u
                            (get_local $l4)
                            (get_local $l5)))
                        (i64.eqz
                          (get_local $l4)))))
                  (i64.const 62))))
            (i64.or
              (i64.shr_u
                (get_local $l4)
                (i64.const 3))
              (i64.shl
                (get_local $p0)
                (i64.const 61)))
            (tee_local $l1
              (i64.eqz
                (i64.and
                  (get_local $l5)
                  (i64.const 9007199254740992))))))
        (set_local $l2
          (select
            (get_local $l2)
            (get_local $l0)
            (get_local $l1))))
      (set_local $l6
        (f64.reinterpret/i64
          (i64.or
            (i64.or
              (i64.and
                (i64.shl
                  (i64.extend_u/i32
                    (i32.add
                      (get_local $l2)
                      (i32.const 1023)))
                  (i64.const 52))
                (i64.const 9218868437227405312))
              (i64.and
                (get_local $p1)
                (i64.const -9223372036854775808)))
            (i64.and
              (get_local $p0)
              (i64.const 4503599627370495))))))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l3)
        (i32.const 48)))
    (get_local $l6))
  (func $__floatunsisf (export "__floatunsisf") (type $t15) (param $p0 i32) (result f32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32)
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (block $B4
              (br_if $B4
                (i32.eqz
                  (get_local $p0)))
              (set_local $l2
                (i32.sub
                  (i32.const 31)
                  (tee_local $l0
                    (i32.clz
                      (get_local $p0)))))
              (br_if $B3
                (i32.le_u
                  (tee_local $l0
                    (i32.sub
                      (i32.const 32)
                      (get_local $l0)))
                  (i32.const 24)))
              (br_if $B2
                (i32.eq
                  (get_local $l0)
                  (i32.const 25)))
              (br_if $B1
                (i32.eq
                  (get_local $l0)
                  (i32.const 26)))
              (set_local $p0
                (i32.or
                  (i32.ne
                    (i32.shl
                      (get_local $p0)
                      (i32.and
                        (i32.sub
                          (i32.const 58)
                          (get_local $l0))
                        (i32.const 31)))
                    (i32.const 0))
                  (i32.shr_u
                    (get_local $p0)
                    (i32.and
                      (i32.add
                        (get_local $l0)
                        (i32.const 6))
                      (i32.const 31)))))
              (br $B1))
            (return
              (f32.const 0x0p+0 (;=0;))))
          (set_local $p0
            (i32.shl
              (get_local $p0)
              (i32.and
                (i32.sub
                  (i32.const 24)
                  (get_local $l0))
                (i32.const 31))))
          (br $B0))
        (set_local $p0
          (i32.shl
            (get_local $p0)
            (i32.const 1))))
      (set_local $p0
        (select
          (i32.shr_u
            (tee_local $p0
              (i32.add
                (i32.or
                  (i32.and
                    (i32.shr_u
                      (get_local $p0)
                      (i32.const 2))
                    (i32.const 1))
                  (get_local $p0))
                (i32.const 1)))
            (i32.const 3))
          (tee_local $p0
            (i32.shr_u
              (get_local $p0)
              (i32.const 2)))
          (tee_local $l1
            (i32.and
              (get_local $p0)
              (i32.const 16777216)))))
      (set_local $l2
        (select
          (get_local $l0)
          (get_local $l2)
          (get_local $l1))))
    (f32.reinterpret/i32
      (i32.or
        (i32.and
          (i32.add
            (i32.shl
              (get_local $l2)
              (i32.const 23))
            (i32.const 1065353216))
          (i32.const 2139095040))
        (i32.and
          (get_local $p0)
          (i32.const 8388607)))))
  (func $__floatunsidf (export "__floatunsidf") (type $t16) (param $p0 i32) (result f64)
    (local $l0 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (get_local $p0)))
      (return
        (f64.reinterpret/i64
          (i64.or
            (i64.shl
              (i64.extend_u/i32
                (i32.sub
                  (i32.const 1054)
                  (tee_local $l0
                    (i32.clz
                      (get_local $p0)))))
              (i64.const 52))
            (i64.and
              (i64.shl
                (i64.extend_u/i32
                  (get_local $p0))
                (i64.extend_u/i32
                  (i32.and
                    (i32.sub
                      (i32.const 117)
                      (i32.sub
                        (i32.const 32)
                        (get_local $l0)))
                    (i32.const 63))))
              (i64.const 4503599627370495))))))
    (f64.const 0x0p+0 (;=0;)))
  (func $__floatundidf (export "__floatundidf") (type $t17) (param $p0 i64) (result f64)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i64)
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (block $B4
              (br_if $B4
                (i64.eqz
                  (get_local $p0)))
              (set_local $l2
                (i32.sub
                  (i32.const 63)
                  (tee_local $l0
                    (i32.wrap/i64
                      (i64.clz
                        (get_local $p0))))))
              (br_if $B3
                (i32.le_u
                  (tee_local $l0
                    (i32.sub
                      (i32.const 64)
                      (get_local $l0)))
                  (i32.const 53)))
              (br_if $B2
                (i32.eq
                  (get_local $l0)
                  (i32.const 54)))
              (br_if $B1
                (i32.eq
                  (get_local $l0)
                  (i32.const 55)))
              (set_local $p0
                (i64.or
                  (i64.extend_u/i32
                    (i64.ne
                      (i64.shl
                        (get_local $p0)
                        (i64.extend_u/i32
                          (i32.and
                            (i32.sub
                              (i32.const 119)
                              (get_local $l0))
                            (i32.const 63))))
                      (i64.const 0)))
                  (i64.shr_u
                    (get_local $p0)
                    (i64.extend_u/i32
                      (i32.and
                        (i32.add
                          (get_local $l0)
                          (i32.const 9))
                        (i32.const 63))))))
              (br $B1))
            (return
              (f64.const 0x0p+0 (;=0;))))
          (set_local $p0
            (i64.shl
              (get_local $p0)
              (i64.extend_u/i32
                (i32.and
                  (i32.sub
                    (i32.const 53)
                    (get_local $l0))
                  (i32.const 63)))))
          (br $B0))
        (set_local $p0
          (i64.shl
            (get_local $p0)
            (i64.const 1))))
      (set_local $p0
        (select
          (tee_local $l3
            (i64.shr_u
              (tee_local $p0
                (i64.add
                  (i64.or
                    (i64.and
                      (i64.shr_u
                        (get_local $p0)
                        (i64.const 2))
                      (i64.const 1))
                    (get_local $p0))
                  (i64.const 1)))
              (i64.const 2)))
          (i64.shr_u
            (get_local $p0)
            (i64.const 3))
          (tee_local $l1
            (i64.eqz
              (i64.and
                (get_local $l3)
                (i64.const 9007199254740992))))))
      (set_local $l2
        (select
          (get_local $l2)
          (get_local $l0)
          (get_local $l1))))
    (f64.reinterpret/i64
      (i64.or
        (i64.and
          (i64.shl
            (i64.extend_u/i32
              (i32.add
                (get_local $l2)
                (i32.const 1023)))
            (i64.const 52))
          (i64.const 9218868437227405312))
        (i64.and
          (get_local $p0)
          (i64.const 4503599627370495)))))
  (func $__floatuntisf (export "__floatuntisf") (type $t18) (param $p0 i64) (param $p1 i64) (result f32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i64) (local $l5 f32)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l3
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 48))))
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (block $B4
              (block $B5
                (br_if $B5
                  (i64.eqz
                    (i64.or
                      (get_local $p0)
                      (get_local $p1))))
                (set_local $l2
                  (i32.sub
                    (i32.const 127)
                    (tee_local $l0
                      (i32.wrap/i64
                        (select
                          (i64.clz
                            (get_local $p1))
                          (i64.add
                            (i64.clz
                              (get_local $p0))
                            (i64.const 64))
                          (i64.ne
                            (get_local $p1)
                            (i64.const 0)))))))
                (br_if $B4
                  (i32.le_u
                    (tee_local $l0
                      (i32.sub
                        (i32.const 128)
                        (get_local $l0)))
                    (i32.const 24)))
                (br_if $B3
                  (i32.eq
                    (get_local $l0)
                    (i32.const 25)))
                (br_if $B2
                  (i32.eq
                    (get_local $l0)
                    (i32.const 26)))
                (call $__ashlti3
                  (get_local $l3)
                  (get_local $p0)
                  (get_local $p1)
                  (i32.and
                    (i32.sub
                      (i32.const 154)
                      (get_local $l0))
                    (i32.const 127)))
                (call $__lshrti3
                  (i32.add
                    (get_local $l3)
                    (i32.const 16))
                  (get_local $p0)
                  (get_local $p1)
                  (i32.and
                    (i32.add
                      (get_local $l0)
                      (i32.const 102))
                    (i32.const 127)))
                (set_local $p0
                  (i64.or
                    (i64.extend_u/i32
                      (i64.ne
                        (i64.or
                          (i64.load
                            (get_local $l3))
                          (i64.load
                            (i32.add
                              (get_local $l3)
                              (i32.const 8))))
                        (i64.const 0)))
                    (i64.load offset=16
                      (get_local $l3))))
                (set_local $p1
                  (i64.load
                    (i32.add
                      (i32.add
                        (get_local $l3)
                        (i32.const 16))
                      (i32.const 8))))
                (br $B2))
              (set_local $l5
                (f32.const 0x0p+0 (;=0;)))
              (br $B0))
            (call $__ashlti3
              (i32.add
                (get_local $l3)
                (i32.const 32))
              (get_local $p0)
              (get_local $p1)
              (i32.and
                (i32.sub
                  (i32.const 24)
                  (get_local $l0))
                (i32.const 127)))
            (set_local $p1
              (i64.load offset=32
                (get_local $l3)))
            (br $B1))
          (set_local $p1
            (i64.or
              (i64.shl
                (get_local $p1)
                (i64.const 1))
              (i64.shr_u
                (get_local $p0)
                (i64.const 63))))
          (set_local $p0
            (i64.shl
              (get_local $p0)
              (i64.const 1))))
        (set_local $p1
          (select
            (tee_local $l4
              (i64.or
                (i64.shr_u
                  (tee_local $p0
                    (i64.add
                      (tee_local $l4
                        (i64.or
                          (i64.and
                            (i64.shr_u
                              (get_local $p0)
                              (i64.const 2))
                            (i64.const 1))
                          (get_local $p0)))
                      (i64.const 1)))
                  (i64.const 2))
                (i64.shl
                  (tee_local $p1
                    (i64.add
                      (get_local $p1)
                      (select
                        (i64.const 1)
                        (i64.extend_u/i32
                          (i64.lt_u
                            (get_local $p0)
                            (get_local $l4)))
                        (i64.eqz
                          (get_local $p0)))))
                  (i64.const 62))))
            (i64.or
              (i64.shr_u
                (get_local $p0)
                (i64.const 3))
              (i64.shl
                (get_local $p1)
                (i64.const 61)))
            (tee_local $l1
              (i64.eqz
                (i64.and
                  (get_local $l4)
                  (i64.const 16777216))))))
        (set_local $l2
          (select
            (get_local $l2)
            (get_local $l0)
            (get_local $l1))))
      (set_local $l5
        (f32.reinterpret/i32
          (i32.or
            (i32.and
              (i32.add
                (i32.shl
                  (get_local $l2)
                  (i32.const 23))
                (i32.const 1065353216))
              (i32.const 2139095040))
            (i32.and
              (i32.wrap/i64
                (get_local $p1))
              (i32.const 8388607))))))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l3)
        (i32.const 48)))
    (get_local $l5))
  (func $__floatuntidf (export "__floatuntidf") (type $t19) (param $p0 i64) (param $p1 i64) (result f64)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i64) (local $l5 f64)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l3
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 48))))
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (block $B4
              (block $B5
                (br_if $B5
                  (i64.eqz
                    (i64.or
                      (get_local $p0)
                      (get_local $p1))))
                (set_local $l2
                  (i32.sub
                    (i32.const 127)
                    (tee_local $l0
                      (i32.wrap/i64
                        (select
                          (i64.clz
                            (get_local $p1))
                          (i64.add
                            (i64.clz
                              (get_local $p0))
                            (i64.const 64))
                          (i64.ne
                            (get_local $p1)
                            (i64.const 0)))))))
                (br_if $B4
                  (i32.le_u
                    (tee_local $l0
                      (i32.sub
                        (i32.const 128)
                        (get_local $l0)))
                    (i32.const 53)))
                (br_if $B3
                  (i32.eq
                    (get_local $l0)
                    (i32.const 54)))
                (br_if $B2
                  (i32.eq
                    (get_local $l0)
                    (i32.const 55)))
                (call $__ashlti3
                  (get_local $l3)
                  (get_local $p0)
                  (get_local $p1)
                  (i32.and
                    (i32.sub
                      (i32.const 183)
                      (get_local $l0))
                    (i32.const 127)))
                (call $__lshrti3
                  (i32.add
                    (get_local $l3)
                    (i32.const 16))
                  (get_local $p0)
                  (get_local $p1)
                  (i32.and
                    (i32.add
                      (get_local $l0)
                      (i32.const 73))
                    (i32.const 127)))
                (set_local $p0
                  (i64.or
                    (i64.extend_u/i32
                      (i64.ne
                        (i64.or
                          (i64.load
                            (get_local $l3))
                          (i64.load
                            (i32.add
                              (get_local $l3)
                              (i32.const 8))))
                        (i64.const 0)))
                    (i64.load offset=16
                      (get_local $l3))))
                (set_local $p1
                  (i64.load
                    (i32.add
                      (i32.add
                        (get_local $l3)
                        (i32.const 16))
                      (i32.const 8))))
                (br $B2))
              (set_local $l5
                (f64.const 0x0p+0 (;=0;)))
              (br $B0))
            (call $__ashlti3
              (i32.add
                (get_local $l3)
                (i32.const 32))
              (get_local $p0)
              (get_local $p1)
              (i32.and
                (i32.sub
                  (i32.const 53)
                  (get_local $l0))
                (i32.const 127)))
            (set_local $p1
              (i64.load offset=32
                (get_local $l3)))
            (br $B1))
          (set_local $p1
            (i64.or
              (i64.shl
                (get_local $p1)
                (i64.const 1))
              (i64.shr_u
                (get_local $p0)
                (i64.const 63))))
          (set_local $p0
            (i64.shl
              (get_local $p0)
              (i64.const 1))))
        (set_local $p1
          (select
            (tee_local $l4
              (i64.or
                (i64.shr_u
                  (tee_local $p0
                    (i64.add
                      (tee_local $l4
                        (i64.or
                          (i64.and
                            (i64.shr_u
                              (get_local $p0)
                              (i64.const 2))
                            (i64.const 1))
                          (get_local $p0)))
                      (i64.const 1)))
                  (i64.const 2))
                (i64.shl
                  (tee_local $p1
                    (i64.add
                      (get_local $p1)
                      (select
                        (i64.const 1)
                        (i64.extend_u/i32
                          (i64.lt_u
                            (get_local $p0)
                            (get_local $l4)))
                        (i64.eqz
                          (get_local $p0)))))
                  (i64.const 62))))
            (i64.or
              (i64.shr_u
                (get_local $p0)
                (i64.const 3))
              (i64.shl
                (get_local $p1)
                (i64.const 61)))
            (tee_local $l1
              (i64.eqz
                (i64.and
                  (get_local $l4)
                  (i64.const 9007199254740992))))))
        (set_local $l2
          (select
            (get_local $l2)
            (get_local $l0)
            (get_local $l1))))
      (set_local $l5
        (f64.reinterpret/i64
          (i64.or
            (i64.and
              (i64.shl
                (i64.extend_u/i32
                  (i32.add
                    (get_local $l2)
                    (i32.const 1023)))
                (i64.const 52))
              (i64.const 9218868437227405312))
            (i64.and
              (get_local $p1)
              (i64.const 4503599627370495))))))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l3)
        (i32.const 48)))
    (get_local $l5))
  (func $__fixsfsi (export "__fixsfsi") (type $t20) (param $p0 f32) (result i32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32)
    (set_local $l3
      (i32.const 0))
    (block $B0
      (block $B1
        (br_if $B1
          (i32.lt_u
            (tee_local $l2
              (i32.and
                (tee_local $l0
                  (i32.reinterpret/f32
                    (get_local $p0)))
                (i32.const 2139095040)))
            (i32.const 1065353216)))
        (br_if $B0
          (i32.le_u
            (tee_local $l2
              (i32.add
                (tee_local $l3
                  (i32.shr_u
                    (get_local $l2)
                    (i32.const 23)))
                (i32.const -127)))
            (i32.const 30)))
        (set_local $l3
          (i32.add
            (i32.shr_u
              (get_local $l0)
              (i32.const 31))
            (i32.const 2147483647))))
      (return
        (get_local $l3)))
    (set_local $l1
      (i32.or
        (i32.and
          (get_local $l0)
          (i32.const 8388607))
        (i32.const 8388608)))
    (block $B2
      (block $B3
        (br_if $B3
          (i32.gt_u
            (get_local $l2)
            (i32.const 22)))
        (set_local $l3
          (i32.shr_u
            (get_local $l1)
            (i32.and
              (i32.sub
                (i32.const 150)
                (get_local $l3))
              (i32.const 31))))
        (br $B2))
      (set_local $l3
        (i32.shl
          (get_local $l1)
          (i32.and
            (i32.add
              (get_local $l3)
              (i32.const 10))
            (i32.const 31)))))
    (select
      (get_local $l3)
      (i32.sub
        (i32.const 0)
        (get_local $l3))
      (i32.gt_s
        (get_local $l0)
        (i32.const -1))))
  (func $__fixsfdi (export "__fixsfdi") (type $t21) (param $p0 f32) (result i64)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i64)
    (set_local $l4
      (i64.const 0))
    (block $B0
      (block $B1
        (br_if $B1
          (i32.lt_u
            (tee_local $l3
              (i32.and
                (tee_local $l0
                  (i32.reinterpret/f32
                    (get_local $p0)))
                (i32.const 2139095040)))
            (i32.const 1065353216)))
        (br_if $B0
          (i32.le_u
            (tee_local $l2
              (i32.add
                (tee_local $l3
                  (i32.shr_u
                    (get_local $l3)
                    (i32.const 23)))
                (i32.const -127)))
            (i32.const 62)))
        (set_local $l4
          (select
            (i64.const 9223372036854775807)
            (i64.const -9223372036854775808)
            (i32.gt_s
              (get_local $l0)
              (i32.const -1)))))
      (return
        (get_local $l4)))
    (set_local $l1
      (i32.or
        (i32.and
          (get_local $l0)
          (i32.const 8388607))
        (i32.const 8388608)))
    (block $B2
      (block $B3
        (br_if $B3
          (i32.gt_u
            (get_local $l2)
            (i32.const 22)))
        (set_local $l4
          (i64.extend_u/i32
            (i32.shr_u
              (get_local $l1)
              (i32.and
                (i32.sub
                  (i32.const 150)
                  (get_local $l3))
                (i32.const 31)))))
        (br $B2))
      (set_local $l4
        (i64.shl
          (i64.extend_u/i32
            (get_local $l1))
          (i64.extend_u/i32
            (i32.and
              (i32.add
                (get_local $l3)
                (i32.const 42))
              (i32.const 63))))))
    (select
      (get_local $l4)
      (i64.sub
        (i64.const 0)
        (get_local $l4))
      (i32.gt_s
        (get_local $l0)
        (i32.const -1))))
  (func $__fixsfti (export "__fixsfti") (type $t22) (param $p0 i32) (param $p1 f32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i64) (local $l6 i64)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l4
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 16))))
    (set_local $l5
      (i64.const 0))
    (set_local $l6
      (i64.const 0))
    (block $B0
      (block $B1
        (br_if $B1
          (i32.lt_u
            (tee_local $l3
              (i32.and
                (tee_local $l0
                  (i32.reinterpret/f32
                    (get_local $p1)))
                (i32.const 2139095040)))
            (i32.const 1065353216)))
        (br_if $B0
          (i32.le_u
            (tee_local $l2
              (i32.add
                (tee_local $l3
                  (i32.shr_u
                    (get_local $l3)
                    (i32.const 23)))
                (i32.const -127)))
            (i32.const 126)))
        (set_local $l6
          (select
            (i64.const 9223372036854775807)
            (i64.const -9223372036854775808)
            (tee_local $l0
              (i32.gt_s
                (get_local $l0)
                (i32.const -1)))))
        (set_local $l5
          (select
            (i64.const -1)
            (i64.const 0)
            (get_local $l0))))
      (i64.store
        (get_local $p0)
        (get_local $l5))
      (i64.store
        (i32.add
          (get_local $p0)
          (i32.const 8))
        (get_local $l6))
      (i32.store offset=4
        (i32.const 0)
        (i32.add
          (get_local $l4)
          (i32.const 16)))
      (return))
    (set_local $l1
      (i32.or
        (i32.and
          (get_local $l0)
          (i32.const 8388607))
        (i32.const 8388608)))
    (block $B2
      (block $B3
        (br_if $B3
          (i32.gt_u
            (get_local $l2)
            (i32.const 22)))
        (set_local $l5
          (i64.extend_u/i32
            (i32.shr_u
              (get_local $l1)
              (i32.and
                (i32.sub
                  (i32.const 150)
                  (get_local $l3))
                (i32.const 31)))))
        (set_local $l6
          (i64.const 0))
        (br $B2))
      (call $__ashlti3
        (get_local $l4)
        (i64.extend_u/i32
          (get_local $l1))
        (i64.const 0)
        (i32.and
          (i32.add
            (get_local $l3)
            (i32.const 106))
          (i32.const 127)))
      (set_local $l6
        (i64.load
          (i32.add
            (get_local $l4)
            (i32.const 8))))
      (set_local $l5
        (i64.load
          (get_local $l4))))
    (i64.store
      (get_local $p0)
      (select
        (get_local $l5)
        (i64.sub
          (i64.const 0)
          (get_local $l5))
        (tee_local $l0
          (i32.gt_s
            (get_local $l0)
            (i32.const -1)))))
    (i64.store
      (i32.add
        (get_local $p0)
        (i32.const 8))
      (select
        (get_local $l6)
        (i64.sub
          (i64.sub
            (i64.const 0)
            (get_local $l6))
          (i64.extend_u/i32
            (i64.ne
              (get_local $l5)
              (i64.const 0))))
        (get_local $l0)))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l4)
        (i32.const 16))))
  (func $__fixdfsi (export "__fixdfsi") (type $t23) (param $p0 f64) (result i32)
    (local $l0 i32) (local $l1 i32) (local $l2 i64) (local $l3 i64)
    (set_local $l1
      (i32.const 0))
    (block $B0
      (block $B1
        (br_if $B1
          (i32.lt_u
            (tee_local $l0
              (i32.and
                (i32.wrap/i64
                  (tee_local $l3
                    (i64.shr_u
                      (tee_local $l2
                        (i64.reinterpret/f64
                          (get_local $p0)))
                      (i64.const 52))))
                (i32.const 2047)))
            (i32.const 1023)))
        (br_if $B0
          (i32.le_u
            (i32.add
              (get_local $l0)
              (i32.const -1023))
            (i32.const 30)))
        (set_local $l1
          (select
            (i32.const 2147483647)
            (i32.const -2147483648)
            (i64.gt_s
              (get_local $l2)
              (i64.const -1)))))
      (return
        (get_local $l1)))
    (select
      (tee_local $l1
        (i32.wrap/i64
          (i64.shr_u
            (i64.or
              (i64.and
                (get_local $l2)
                (i64.const 4503599627370495))
              (i64.const 4503599627370496))
            (i64.and
              (i64.sub
                (i64.const 1075)
                (get_local $l3))
              (i64.const 63)))))
      (i32.sub
        (i32.const 0)
        (get_local $l1))
      (i64.gt_s
        (get_local $l2)
        (i64.const -1))))
  (func $__fixdfdi (export "__fixdfdi") (type $t24) (param $p0 f64) (result i64)
    (local $l0 i32) (local $l1 i64) (local $l2 i64) (local $l3 i64)
    (set_local $l3
      (i64.const 0))
    (block $B0
      (block $B1
        (br_if $B1
          (i32.lt_u
            (tee_local $l0
              (i32.and
                (i32.wrap/i64
                  (tee_local $l2
                    (i64.shr_u
                      (tee_local $l1
                        (i64.reinterpret/f64
                          (get_local $p0)))
                      (i64.const 52))))
                (i32.const 2047)))
            (i32.const 1023)))
        (br_if $B0
          (i32.le_u
            (tee_local $l0
              (i32.add
                (get_local $l0)
                (i32.const -1023)))
            (i32.const 62)))
        (set_local $l3
          (i64.add
            (i64.shr_u
              (get_local $l1)
              (i64.const 63))
            (i64.const 9223372036854775807))))
      (return
        (get_local $l3)))
    (set_local $l3
      (i64.or
        (i64.and
          (get_local $l1)
          (i64.const 4503599627370495))
        (i64.const 4503599627370496)))
    (block $B2
      (block $B3
        (br_if $B3
          (i32.gt_u
            (get_local $l0)
            (i32.const 51)))
        (set_local $l3
          (i64.shr_u
            (get_local $l3)
            (i64.and
              (i64.sub
                (i64.const 1075)
                (get_local $l2))
              (i64.const 63))))
        (br $B2))
      (set_local $l3
        (i64.shl
          (get_local $l3)
          (i64.and
            (i64.add
              (get_local $l2)
              (i64.const 13))
            (i64.const 63)))))
    (select
      (get_local $l3)
      (i64.sub
        (i64.const 0)
        (get_local $l3))
      (i64.gt_s
        (get_local $l1)
        (i64.const -1))))
  (func $__fixdfti (export "__fixdfti") (type $t25) (param $p0 i32) (param $p1 f64)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i64) (local $l4 i64) (local $l5 i64) (local $l6 i64)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l2
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 16))))
    (set_local $l5
      (i64.const 0))
    (set_local $l6
      (i64.const 0))
    (block $B0
      (block $B1
        (br_if $B1
          (i32.lt_u
            (tee_local $l1
              (i32.and
                (tee_local $l0
                  (i32.wrap/i64
                    (tee_local $l4
                      (i64.shr_u
                        (tee_local $l3
                          (i64.reinterpret/f64
                            (get_local $p1)))
                        (i64.const 52)))))
                (i32.const 2047)))
            (i32.const 1023)))
        (br_if $B0
          (i32.le_u
            (tee_local $l1
              (i32.add
                (get_local $l1)
                (i32.const -1023)))
            (i32.const 126)))
        (set_local $l6
          (select
            (i64.const 9223372036854775807)
            (i64.const -9223372036854775808)
            (tee_local $l1
              (i64.gt_s
                (get_local $l3)
                (i64.const -1)))))
        (set_local $l5
          (select
            (i64.const -1)
            (i64.const 0)
            (get_local $l1))))
      (i64.store
        (get_local $p0)
        (get_local $l5))
      (i64.store
        (i32.add
          (get_local $p0)
          (i32.const 8))
        (get_local $l6))
      (i32.store offset=4
        (i32.const 0)
        (i32.add
          (get_local $l2)
          (i32.const 16)))
      (return))
    (set_local $l5
      (i64.or
        (i64.and
          (get_local $l3)
          (i64.const 4503599627370495))
        (i64.const 4503599627370496)))
    (block $B2
      (block $B3
        (br_if $B3
          (i32.gt_u
            (get_local $l1)
            (i32.const 51)))
        (set_local $l5
          (i64.shr_u
            (get_local $l5)
            (i64.and
              (i64.sub
                (i64.const 1075)
                (get_local $l4))
              (i64.const 63))))
        (set_local $l6
          (i64.const 0))
        (br $B2))
      (call $__ashlti3
        (get_local $l2)
        (get_local $l5)
        (i64.const 0)
        (i32.and
          (i32.add
            (get_local $l0)
            (i32.const 77))
          (i32.const 127)))
      (set_local $l6
        (i64.load
          (i32.add
            (get_local $l2)
            (i32.const 8))))
      (set_local $l5
        (i64.load
          (get_local $l2))))
    (i64.store
      (get_local $p0)
      (select
        (get_local $l5)
        (i64.sub
          (i64.const 0)
          (get_local $l5))
        (tee_local $l1
          (i64.gt_s
            (get_local $l3)
            (i64.const -1)))))
    (i64.store
      (i32.add
        (get_local $p0)
        (i32.const 8))
      (select
        (get_local $l6)
        (i64.sub
          (i64.sub
            (i64.const 0)
            (get_local $l6))
          (i64.extend_u/i32
            (i64.ne
              (get_local $l5)
              (i64.const 0))))
        (get_local $l1)))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l2)
        (i32.const 16))))
  (func $__fixunssfsi (export "__fixunssfsi") (type $t20) (param $p0 f32) (result i32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32)
    (set_local $l2
      (i32.const 0))
    (block $B0
      (br_if $B0
        (i32.lt_s
          (tee_local $l0
            (i32.reinterpret/f32
              (get_local $p0)))
          (i32.const 0)))
      (br_if $B0
        (i32.lt_u
          (tee_local $l1
            (i32.and
              (get_local $l0)
              (i32.const 2139095040)))
          (i32.const 1065353216)))
      (block $B1
        (br_if $B1
          (i32.le_u
            (tee_local $l1
              (i32.add
                (tee_local $l2
                  (i32.shr_u
                    (get_local $l1)
                    (i32.const 23)))
                (i32.const -127)))
            (i32.const 31)))
        (return
          (i32.xor
            (i32.shr_s
              (get_local $l0)
              (i32.const 31))
            (i32.const -1))))
      (set_local $l0
        (i32.or
          (i32.and
            (get_local $l0)
            (i32.const 8388607))
          (i32.const 8388608)))
      (block $B2
        (br_if $B2
          (i32.gt_u
            (get_local $l1)
            (i32.const 22)))
        (return
          (i32.shr_u
            (get_local $l0)
            (i32.and
              (i32.sub
                (i32.const 150)
                (get_local $l2))
              (i32.const 31)))))
      (set_local $l2
        (i32.shl
          (get_local $l0)
          (i32.and
            (i32.add
              (get_local $l2)
              (i32.const 10))
            (i32.const 31)))))
    (get_local $l2))
  (func $__fixunssfdi (export "__fixunssfdi") (type $t21) (param $p0 f32) (result i64)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i64)
    (set_local $l3
      (i64.const 0))
    (block $B0
      (br_if $B0
        (i32.lt_s
          (tee_local $l0
            (i32.reinterpret/f32
              (get_local $p0)))
          (i32.const 0)))
      (br_if $B0
        (i32.lt_u
          (tee_local $l2
            (i32.and
              (get_local $l0)
              (i32.const 2139095040)))
          (i32.const 1065353216)))
      (block $B1
        (br_if $B1
          (i32.le_u
            (tee_local $l1
              (i32.add
                (tee_local $l2
                  (i32.shr_u
                    (get_local $l2)
                    (i32.const 23)))
                (i32.const -127)))
            (i32.const 63)))
        (return
          (i64.xor
            (i64.extend_s/i32
              (i32.shr_s
                (get_local $l0)
                (i32.const 31)))
            (i64.const -1))))
      (set_local $l0
        (i32.or
          (i32.and
            (get_local $l0)
            (i32.const 8388607))
          (i32.const 8388608)))
      (block $B2
        (br_if $B2
          (i32.gt_u
            (get_local $l1)
            (i32.const 22)))
        (return
          (i64.extend_u/i32
            (i32.shr_u
              (get_local $l0)
              (i32.and
                (i32.sub
                  (i32.const 150)
                  (get_local $l2))
                (i32.const 31))))))
      (set_local $l3
        (i64.shl
          (i64.extend_u/i32
            (get_local $l0))
          (i64.extend_u/i32
            (i32.and
              (i32.add
                (get_local $l2)
                (i32.const 42))
              (i32.const 63))))))
    (get_local $l3))
  (func $__fixunssfti (export "__fixunssfti") (type $t22) (param $p0 i32) (param $p1 f32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i64) (local $l5 i64)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l3
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 16))))
    (set_local $l5
      (i64.const 0))
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.lt_s
              (tee_local $l0
                (i32.reinterpret/f32
                  (get_local $p1)))
              (i32.const 0)))
          (br_if $B2
            (i32.lt_u
              (tee_local $l2
                (i32.and
                  (get_local $l0)
                  (i32.const 2139095040)))
              (i32.const 1065353216)))
          (br_if $B1
            (i32.le_u
              (tee_local $l1
                (i32.add
                  (tee_local $l2
                    (i32.shr_u
                      (get_local $l2)
                      (i32.const 23)))
                  (i32.const -127)))
              (i32.const 127)))
          (set_local $l5
            (tee_local $l4
              (i64.xor
                (i64.extend_s/i32
                  (i32.shr_s
                    (get_local $l0)
                    (i32.const 31)))
                (i64.const -1))))
          (br $B0))
        (set_local $l4
          (i64.const 0))
        (br $B0))
      (set_local $l0
        (i32.or
          (i32.and
            (get_local $l0)
            (i32.const 8388607))
          (i32.const 8388608)))
      (block $B3
        (br_if $B3
          (i32.gt_u
            (get_local $l1)
            (i32.const 22)))
        (set_local $l4
          (i64.extend_u/i32
            (i32.shr_u
              (get_local $l0)
              (i32.and
                (i32.sub
                  (i32.const 150)
                  (get_local $l2))
                (i32.const 31)))))
        (br $B0))
      (call $__ashlti3
        (get_local $l3)
        (i64.extend_u/i32
          (get_local $l0))
        (i64.const 0)
        (i32.and
          (i32.add
            (get_local $l2)
            (i32.const 106))
          (i32.const 127)))
      (set_local $l5
        (i64.load
          (i32.add
            (get_local $l3)
            (i32.const 8))))
      (set_local $l4
        (i64.load
          (get_local $l3))))
    (i64.store
      (get_local $p0)
      (get_local $l4))
    (i64.store
      (i32.add
        (get_local $p0)
        (i32.const 8))
      (get_local $l5))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l3)
        (i32.const 16))))
  (func $__fixunsdfsi (export "__fixunsdfsi") (type $t23) (param $p0 f64) (result i32)
    (local $l0 i32) (local $l1 i32) (local $l2 i64) (local $l3 i64)
    (set_local $l1
      (i32.const 0))
    (block $B0
      (br_if $B0
        (i64.lt_s
          (tee_local $l2
            (i64.reinterpret/f64
              (get_local $p0)))
          (i64.const 0)))
      (br_if $B0
        (i32.lt_u
          (tee_local $l0
            (i32.and
              (i32.wrap/i64
                (tee_local $l3
                  (i64.shr_u
                    (get_local $l2)
                    (i64.const 52))))
              (i32.const 2047)))
          (i32.const 1023)))
      (block $B1
        (br_if $B1
          (i32.le_u
            (i32.add
              (get_local $l0)
              (i32.const -1023))
            (i32.const 31)))
        (return
          (i32.xor
            (i32.wrap/i64
              (i64.shr_s
                (get_local $l2)
                (i64.const 63)))
            (i32.const -1))))
      (set_local $l1
        (i32.wrap/i64
          (i64.shr_u
            (i64.or
              (i64.and
                (get_local $l2)
                (i64.const 4503599627370495))
              (i64.const 4503599627370496))
            (i64.and
              (i64.sub
                (i64.const 1075)
                (get_local $l3))
              (i64.const 63))))))
    (get_local $l1))
  (func $__fixunsdfdi (export "__fixunsdfdi") (type $t24) (param $p0 f64) (result i64)
    (local $l0 i32) (local $l1 i64) (local $l2 i64) (local $l3 i64)
    (set_local $l3
      (i64.const 0))
    (block $B0
      (br_if $B0
        (i64.lt_s
          (tee_local $l1
            (i64.reinterpret/f64
              (get_local $p0)))
          (i64.const 0)))
      (br_if $B0
        (i32.lt_u
          (tee_local $l0
            (i32.and
              (i32.wrap/i64
                (tee_local $l2
                  (i64.shr_u
                    (get_local $l1)
                    (i64.const 52))))
              (i32.const 2047)))
          (i32.const 1023)))
      (block $B1
        (br_if $B1
          (i32.le_u
            (tee_local $l0
              (i32.add
                (get_local $l0)
                (i32.const -1023)))
            (i32.const 63)))
        (return
          (i64.xor
            (i64.shr_s
              (get_local $l1)
              (i64.const 63))
            (i64.const -1))))
      (set_local $l1
        (i64.or
          (i64.and
            (get_local $l1)
            (i64.const 4503599627370495))
          (i64.const 4503599627370496)))
      (block $B2
        (br_if $B2
          (i32.gt_u
            (get_local $l0)
            (i32.const 51)))
        (return
          (i64.shr_u
            (get_local $l1)
            (i64.and
              (i64.sub
                (i64.const 1075)
                (get_local $l2))
              (i64.const 63)))))
      (set_local $l3
        (i64.shl
          (get_local $l1)
          (i64.and
            (i64.add
              (get_local $l2)
              (i64.const 13))
            (i64.const 63)))))
    (get_local $l3))
  (func $__fixunsdfti (export "__fixunsdfti") (type $t25) (param $p0 i32) (param $p1 f64)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i64) (local $l4 i64) (local $l5 i64)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $l2
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 16))))
    (set_local $l5
      (i64.const 0))
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i64.lt_s
              (tee_local $l3
                (i64.reinterpret/f64
                  (get_local $p1)))
              (i64.const 0)))
          (br_if $B2
            (i32.lt_u
              (tee_local $l1
                (i32.and
                  (tee_local $l0
                    (i32.wrap/i64
                      (tee_local $l4
                        (i64.shr_u
                          (get_local $l3)
                          (i64.const 52)))))
                  (i32.const 2047)))
              (i32.const 1023)))
          (br_if $B1
            (i32.le_u
              (tee_local $l1
                (i32.add
                  (get_local $l1)
                  (i32.const -1023)))
              (i32.const 127)))
          (set_local $l5
            (tee_local $l3
              (i64.xor
                (i64.shr_s
                  (get_local $l3)
                  (i64.const 63))
                (i64.const -1))))
          (br $B0))
        (set_local $l3
          (i64.const 0))
        (br $B0))
      (set_local $l3
        (i64.or
          (i64.and
            (get_local $l3)
            (i64.const 4503599627370495))
          (i64.const 4503599627370496)))
      (block $B3
        (br_if $B3
          (i32.gt_u
            (get_local $l1)
            (i32.const 51)))
        (set_local $l3
          (i64.shr_u
            (get_local $l3)
            (i64.and
              (i64.sub
                (i64.const 1075)
                (get_local $l4))
              (i64.const 63))))
        (br $B0))
      (call $__ashlti3
        (get_local $l2)
        (get_local $l3)
        (i64.const 0)
        (i32.and
          (i32.add
            (get_local $l0)
            (i32.const 77))
          (i32.const 127)))
      (set_local $l5
        (i64.load
          (i32.add
            (get_local $l2)
            (i32.const 8))))
      (set_local $l3
        (i64.load
          (get_local $l2))))
    (i64.store
      (get_local $p0)
      (get_local $l3))
    (i64.store
      (i32.add
        (get_local $p0)
        (i32.const 8))
      (get_local $l5))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l2)
        (i32.const 16))))
  (table $T0 0 anyfunc)
  (memory $memory (export "memory") 17)
  (data (i32.const 4) "\10\00\10\00"))
