// Copyright (c) Sui Foundation, Inc.
// SPDX-License-Identifier: Apache-2.0

/// A basic Hello World example for Sui Move (Move 2024), part of the Sui Move intro course.
module hello_world::hello_world;

use std::string;

public struct Habit has copy, drop {
    name: string::String, // Rehber vector<u8> demiş ama biz string::String ile daha modern tutalım
    completed: bool,
}

public fun new_habit(name: string::String): Habit {
    Habit {
        name,
        completed: false, // Yeni başlayan bir alışkanlık varsayılan olarak tamamlanmamıştır.
    }
}

#[test]
fun test_habit_creation() {
    let my_habit_name = b"Sui Move Ogren".to_string();
    let my_habit = new_habit(my_habit_name);
    
    assert!(my_habit.completed == false, 0);
}

const NUMBER: u64 = 42;
const FLAG: bool = true;
const MY_ADDRESS: address = @0x1;

#[test_only]
use std::unit_test::assert_eq;

/// An object that contains an arbitrary string.
public struct HelloWorldObject has key {
    id: UID,
    /// The string stored in the object.
    text: string::String,
}

public fun sum(a: u64, b: u64): u64 {
    a + b  // Move'da noktalı virgül koymazsan otomatik 'return' eder
}

#[test]
fun test_sum() {
    let result = sum(1, 2);
    assert_eq!(result, 3);
}

/// Mints a new HelloWorldObject and transfers it to the transaction sender.
#[lint_allow(self_transfer)]
entry fun mint(ctx: &mut TxContext) {
    let object = HelloWorldObject {
        id: object::new(ctx),
        text: b"Hello, Ahsen Berra!".to_string(),
    };
    transfer::transfer(object, ctx.sender());
}
