extern crate stark_suit_repair;

use std::collections::HashMap;

use stark_suit_repair::basics::{
    factorize, gauss, in_range, longest_sequence, mean, rotate, subset, substr, to_decimal,
};
use stark_suit_repair::communicator::{to_command, Command};

// adding linked list tests
use stark_suit_repair::linkedlist::{Armor, Component, List, Suit};

//Basic Functions
#[test]
fn public_gauss() {
    assert_eq!(190, gauss(19)); //prime
    assert_eq!(1, gauss(1));
    assert_eq!(54615, gauss(330)); //composite
    assert_eq!(-1, gauss(-400));
}

#[test]
fn public_in_range() {
    let xs = [1, 3, 5];
    assert_eq!(1, in_range(&xs, 2, 4));
    let xs = [1, 2, 3, 5, 6];
    assert_eq!(2, in_range(&xs, 2, 4));
    let xs = [-4, -3, -2, -1, 0, 1, 2, 3, 4];
    assert_eq!(9, in_range(&xs, -5, 5));
}

#[test]
fn public_subset() {
    let ys = [1, 2, 3, 4, 5];
    let xs = [3, 2, 1];
    let zs = [6];

    assert_eq!(true, subset(&ys, &xs));
    assert_eq!(false, subset(&ys, &zs));
    assert_eq!(true, subset(&ys, &ys));
}

#[test]
fn public_mean() {
    let xs = [1 as f64, 2 as f64, 3 as f64, 4 as f64];
    assert_eq!(Some(2.5), mean(&xs));
    let xs = [-4 as f64, -5 as f64, -6 as f64];
    assert_eq!(Some(-5.), mean(&xs));
    let xs = [-400 as f64, 1 as f64, 2 as f64, 2 as f64, 400 as f64];
    assert_eq!(Some(1.), mean(&xs));
}

#[test]
fn public_decimal() {
    let xs = [1, 0, 1, 0, 0, 1, 0, 1, 0];
    assert_eq!(330, to_decimal(&xs));

    let ys = [0];
    assert_eq!(0, to_decimal(&ys));

    let zs = [1, 0, 1, 0, 1, 1, 1, 1, 1];
    assert_eq!(351, to_decimal(&zs));
}

#[test]
fn public_factorize() {
    let mut vec = Vec::new();
    vec.push(2);
    vec.push(2);
    assert_eq!(vec, factorize(4));
    vec.remove(0);
    vec.remove(0);
    vec.push(19);
    assert_eq!(vec, factorize(19));
    vec.remove(0);
    vec.push(2);
    vec.push(3);
    vec.push(5);
    vec.push(11);
    assert_eq!(vec, factorize(330));
}

#[test]
fn public_rotate() {
    let mut vec = Vec::new();
    vec.push(3);
    vec.push(3);
    vec.push(0);

    let xs = [0, 3, 3];
    assert_eq!(vec, rotate(&xs));

    vec.remove(0);
    vec.remove(0);
    vec.remove(0);

    let xs = [1];
    vec.push(1);
    assert_eq!(vec, rotate(&xs));
    vec.remove(0);

    let xs = [1, 1, 2, 1];
    vec.push(1);
    vec.push(2);
    vec.push(1);
    vec.push(1);
    assert_eq!(vec, rotate(&xs));
}

#[test]
fn public_substr() {
    assert_eq!(
        true,
        substr(
            &"CMSC 330 is the best CS class".to_string(),
            &"CMSC 330".to_string()
        )
    );
    assert_eq!(
        false,
        substr(
            &"CMSC 330 is the best CS class".to_string(),
            &"CMSC 351 is the best CS class".to_string()
        )
    );
    assert_eq!(
        true,
        substr(&"I love CMSC330".to_string(), &"I love CMSC330".to_string())
    );
}

#[test]
fn public_longseq() {
    assert_eq!(Some("aa"), longest_sequence(&"aabbaa".to_string()));
    assert_eq!(Some("bb"), longest_sequence(&"a abba a".to_string()));
    assert_eq!(Some("bbbbbb"), longest_sequence(&"babaabbbaaaabbbbbbaaaa"));
}

// Linked List
#[test]
fn public_new_list() {
    let mut new_list = List::new();
    assert_eq!(new_list.size(), 0);
    assert_eq!(new_list.pop(), None);
}

#[test]
fn public_list_push() {
    let helm = Armor {
        component: Component::Helmet(true),
        version: 0,
    };
    let mut new_list = List::new();
    new_list.push(helm);
    assert_eq!(new_list.pop(), Some(helm));
}

#[test]
fn public_read_and_write_parallel() {
    use std::thread;

    let mut l = List::new();
    let wifi = Armor {
        component: Component::Wifi(true),
        version: 0,
    };
    l.push(wifi);
    let l1 = l.clone();
    thread::spawn(move || {
        let l = l1;
        let h = l.peek().unwrap();
        assert_eq!(h, wifi);
        assert_eq!(l.size(), 1);
    });

    let l1 = l.clone();
    thread::spawn(move || {
        let mut l = l1;
        let comp = l.pop().unwrap();
        assert_eq!(comp, wifi);
        assert_eq!(l.size(), 0);
    });
}

#[test]
fn public_compatible() {
    {
        let mut suit = Suit {
            armor: List::new(),
            version: 1,
        };

        let wifi = Armor {
            component: Component::Wifi(true),
            version: 1,
        };
        suit.armor.push(wifi);

        let helm = Armor {
            component: Component::Helmet(true),
            version: 1,
        };
        suit.armor.push(helm);
        assert!(suit.is_compatible());
    }

    {
        let mut suit = Suit {
            armor: List::new(),
            version: 0,
        };

        let wifi = Armor {
            component: Component::Wifi(true),
            version: 1,
        };
        suit.armor.push(wifi);

        let helm = Armor {
            component: Component::Helmet(true),
            version: 1,
        };
        suit.armor.push(helm);
        assert!(!suit.is_compatible());
    }
}

#[test]
fn public_repair() {
    let mut suit = Suit {
        armor: List::new(),
        version: 1,
    };

    let repul = Armor {
        component: Component::LeftRepulsor(true, 80),
        version: 1,
    };
    suit.armor.push(repul);

    suit.repair();
    assert_eq!(
        suit.armor.peek(),
        Some(Armor {
            component: Component::LeftRepulsor(false, 100),
            version: 1,
        })
    )
}

//Communicator Functions
#[test]
fn public_power() {
    assert_eq!("Power increased by 60%", Command::Power(true, 60).as_str());
    assert_eq!("Power decreased by 30%", Command::Power(false, 30).as_str());

    assert_eq!(Command::Power(true, 60), to_command("power inc 60"));
    assert_eq!(Command::Power(false, 30), to_command("power dec 30"));
}

#[test]
fn public_missiles() {
    assert_eq!(
        "Missiles increased by 60",
        Command::Missiles(true, 60).as_str()
    );
    assert_eq!(
        "Missiles decreased by 30",
        Command::Missiles(false, 30).as_str()
    );

    assert_eq!(Command::Missiles(true, 60), to_command("add 60 missiles"));
    assert_eq!(Command::Missiles(false, 30), to_command("fire 30 missiles"));
}

#[test]
fn public_shield() {
    assert_eq!("Shield turned on", Command::Shield(true).as_str());
    assert_eq!("Shield turned off", Command::Shield(false).as_str());

    assert_eq!(Command::Shield(true), to_command("shield on"));
    assert_eq!(Command::Shield(false), to_command("shield off"));
}

#[test]
fn public_misc() {
    assert_eq!("Call attempt failed", Command::Try.as_str());
    assert_eq!("Not a command", Command::Invalid.as_str());

    assert_eq!(Command::Try, to_command("try calling Miss Potts"));
    assert_eq!(Command::Invalid, to_command("jarvis!"));
}
