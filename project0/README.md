# Project 0: Setup

Due: February 9, 2022 at 11:59 PM

This project is simply to get your system ready.  You will "submit" this project for a grade.  The good-faith attempt (GFA) rule **does not apply** to this project.

**Start with the [Instructions](#instructions)!**

## Table of Contents

- [Languages and Packages](#languages-and-packages)
- [Instructions](#instructions)
  - [Linux (NOT WSL)](#linux-not-wsl)
  - [Windows](#windows)
  - [macOS](#macos)
- [Verifying Setup](#verifying-setup)
- [Troubleshooting `gradescope-submit`](#troubleshooting-gradescope-submit)
  - [Incorrect Passwords](#incorrect-passwords)
  - [HTTP Errors](#http-errors)
- [Special macOS Instructions](#special-macos-instructions)
  - [Do you have a Mac running an older version of macOS?](#do-you-have-a-mac-running-an-older-version-of-macos)


## Languages and Packages

In this course, we will primarily be using Ruby and OCaml.  Below is a summary of the packages that need to be installed.  You do not need to use these links, they are just for reference or learning more about the languages and/or packages.  You can skip below to the instructions.

- [Git](https://git-scm.com/)
- [Ruby](https://www.ruby-lang.org)
    - [minitest](https://rubygems.org/gems/minitest)
    - [sqlite3](https://rubygems.org/gems/sqlite3)
    - [sinatra](https://rubygems.org/gems/sinatra)
- [OCaml](http://ocaml.org)
    - [OPAM](https://opam.ocaml.org)
    - [OUnit](https://opam.ocaml.org/packages/ounit)
    - [dune](https://opam.ocaml.org/packages/dune)
    - [utop](https://opam.ocaml.org/packages/utop)
- [Rust](https://www.rust-lang.org)
- [SQLite3](https://sqlite.org)
- [Graphviz](http://graphviz.org)


## Instructions

First, you will need to clone this repository to your local filesystem.  You'll only have to do this once this semester (unless you have multiple computers or delete the repository).  To do this, run:

```
git clone https://github.com/umd-cmsc330/cmsc330spring22
```

The files in the `project0` folder will be used for the [Verifying Setup](#verifying-setup) section at the bottom.

The following sections will help you install the necessary packages and programs on your operating system.  Some steps may take a long time, please be patient.  **Read all instructions very carefully.**

The output of each command is important, please pay careful attention to what each one prints.  If you encounter an error message, do not ignore it.  We will be available in office hours to help you get set up if you run into problems.  As a general rule, no output means the command executed successfully.

**Please skip to the section below that corresponds with your operating system.**


### Linux (NOT WSL)

These instructions assume you have a Debian-based system (e.g. Ubuntu).  If you have a different distribution, you will have to find and download the corresponding packages in your native package manager.  Note that the packages there may have slightly different names.

1. Firstly, install the basic dependencies:
    - Run `sudo apt update` to update your local package listing
    - Run `sudo apt install ruby-dev sqlite3 libsqlite3-dev ocaml ocaml-native-compilers camlp4 make m4 curl graphviz libssl-dev pkg-config`
2. Install some Ruby gems
    - Run `sudo gem install --no-document minitest sqlite3 sinatra`
3. Install and initialize the OCaml package manager
    - Run `sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)` (when prompted for the installation location, just hit enter to select the default)
        - Run `opam --version`.  You should be on version 2 (followed by some versions, just make sure the major version is 2).  Check out [the manual](https://opam.ocaml.org/doc/Install.html) if this is not the case, you may have to follow special directions for your particular operating system and version.
        - If you encounter any issues, or are running a different flavor of linux, check out [the manual](https://opam.ocaml.org/doc/Install.html)
    - Run `opam init`
    - If it hangs at "Fetching repository information" press Enter. This may take a while, be patient
    - When prompted to modify `~/.profile` (or another file), type "n", but remember the filename
    - Open `~/.profile` (or the file mentioned above) in your text editor
    - Add the line `` eval `opam config env` `` (note these are backticks, not single quotes)
    - Save the file
    - Run `source ~/.profile` (or the file you just edited)
4. Initialize OCaml
    - We will be using OCaml version 4.12.0.  Run `ocaml -version` to check which version is currently installed
    - If you are already on 4.12.0, you can skip to #5
    - Run `opam update`
    - If you are on another version, run `opam switch 4.12.0`.  If you get an error saying that switch is not currently installed, run `opam switch create 4.12.0`.  This may take a while, please be patient
    - Run `eval $(opam env)`
    - Ensure you are now on the correct version by running `ocaml -version`
5. Install OCaml packages
    - Run `opam install ocamlfind ounit utop dune qcheck`
6. Install Rust
    - Go to [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install) and run the installation command provided
    - If prompted, just select the defaults
    - Append `~/.cargo/bin` to the `PATH` environment variable. Frist, do `echo $SHELL`.
      - If `echo $SHELL` gives `/bin/zsh`, do `echo "export PATH=\"$HOME/.cargo/bin:$PATH\"" >> ~/.zshrc`
      - If `echo $SHELL` gives `/bin/bash`, do `echo "export PATH=\"$HOME/.cargo/bin:$PATH\"" >> ~/.bashrc`
7. Install gradescope-submit
    - Run `cargo install gradescope-submit`.  If this fails, try closing and re-opening your terminal window.


### Windows

*This will only work on Windows 10 and newer.  If you are on an older version, you will probably need to set up a Linux VM.*

1. Follow the directions [here](https://docs.microsoft.com/en-us/windows/wsl/install-win10) to install the Windows Subsystem for Linux
2. Install the basic dependencies:
    - Run `sudo apt update && sudo apt upgrade` to update your local package listing
    - Run `sudo apt install ruby-dev sqlite3 libsqlite3-dev ocaml ocaml-native-compilers camlp4 make m4 curl graphviz libssl-dev pkg-config`
3. Install some Ruby gems
    - Run `sudo gem install --no-document minitest sqlite3 sinatra`
4. Install and initialize the OCaml package manager
    - Run `sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)` (when prompted for the installation location, just hit enter to select the default)
        - Run `opam --version`.  You should be on version 2 (followed by some versions, just make sure the major version is 2).  Check out [the manual](https://opam.ocaml.org/doc/Install.html) if this is not the case, you may have to follow special directions for your particular operating system and version.
        - If you encounter any issues, or are running a different flavor of linux, check out [the manual](https://opam.ocaml.org/doc/Install.html)
    - Run `opam init --disable-sandboxing`
    - If it hangs at "Fetching repository information" press Enter. This may take a while, be patient
    - When prompted to modify `~/.profile` (or another file), type "n", but remember the filename
    - Open `~/.profile` (or the file mentioned above) in your text editor
    - Add the line `` eval `opam config env` `` (note these are backticks, not single quotes)
    - Save the file
    - Run `source ~/.profile` (or the file you just edited)
5. Initialize OCaml
    - We will be using OCaml version 4.12.0.  Run `ocaml -version` to check which version is currently installed
    - If you are already on 4.12.0, you can skip to #6
    - Run `opam update`
    - If you are on another version, run `opam switch 4.12.0`.  If you get an error saying that switch is not currently installed, run `opam switch create 4.12.0`.  This may take a while, please be patient
    - Run `eval $(opam env)`
    - Ensure you are now on the correct version by running `ocaml -version`
6. Install OCaml packages
    - Run `opam install ocamlfind ounit utop dune qcheck`
7. Install Rust
    - Go to [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install) and run the installation command provided
    - If prompted, just select the defaults
    - Append `~/.cargo/bin` to the `PATH` environment variable. First, do `echo $SHELL`.
      - If `echo $SHELL` gives `/bin/zsh`, do `echo "export PATH=\"$HOME/.cargo/bin:$PATH\"" >> ~/.zshrc`
      - If `echo $SHELL` gives `/bin/bash`, do `echo "export PATH=\"$HOME/.cargo/bin:$PATH\"" >> ~/.bashrc`
8. Install gradescope-submit
    - Run `cargo install gradescope-submit`.  If this fails, try closing and
      re-opening your terminal window.


### macOS

Check the [Special macOS Instructions](#special-macos-instructions) to check if you need to follow any special steps, then come back here.

1. Install the Homebrew package manager (Updated in Fall 2021)
    - Run `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Check your Ruby version by running `ruby -v`.  If it's older than 2.2.2,
   you'll need to install a newer version using `brew install ruby`
3. Install the basic dependencies
    - Run `brew install ocaml opam graphviz openssl`
4. Install some Ruby gems
    - Run `sudo gem install --no-document minitest sqlite3 sinatra`
5. Initialize the OCaml package manager
    - Run `opam init`
    - When prompted to modify `~/.zshrc` or `~/.bash_profile` (or similar file), type "y"
    - Run  `source ~/.zshrc` or `source ~/.bash_profile` (or the file mentioned above)
6. Initialize OCaml
    - We will be using OCaml version 4.12.0.  Run `ocaml -version` to check
      which version is currently installed
    - If you are already on 4.12.0, you can skip to #7
    - Run `opam update`
    - If you are on another version, run `opam switch 4.12.0`.  If you get an
      error saying that switch is not currently installed, run `opam switch
      create 4.12.0`.  This may take a while, please be patient
    - Run `eval $(opam env)`
    - Ensure you are now on the correct version by running `ocaml -version`
7. Install OCaml packages
    - Run `opam install ocamlfind ounit utop dune qcheck`
8. Install Rust
    - Go to [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install) and run the installation command provided
    - If prompted, just select the defaults
    - Append `~/.cargo/bin` to the `PATH` environment variable. Frist, do `echo $SHELL`.
      - If `echo $SHELL` gives `/bin/zsh`, do `echo "export PATH=\"$HOME/.cargo/bin:$PATH\"" >> ~/.zshrc`
      - If `echo $SHELL` gives `/bin/bash`, do `echo "export PATH=\"$HOME/.cargo/bin:$PATH\"" >> ~/.bashrc`
9. Install gradescope-submit
    - Run `cargo install gradescope-submit`.  If this fails, try closing and
      re-opening your terminal window.


## Verifying Setup

This is the graded part of this project.  To verify that you have the correct
versions installed, run `ruby test/public/public.rb` in this directory.  You
should not get any errors.  This will create a file called p0.report.  Submit
this file by running `gradescope-submit` in the project folder.  You will have
to enter your credentials the first time, but for future projects you should not
have to.  Alternatively, you can manually submit the file to Gradescope by
uploading the p0.report file to the appropriate assignment.

## Troubleshooting `gradescope-submit`

### Incorrect Passwords 

Make sure that the email address and password you entered is of the account
where your CMSC 330 course enrollment shows up. (If you login through "school
credentials" option and don't remember your **Gradescope** password, please
reset it.) Great chances are that people have multiple Gradescope accounts, and
it is suggested to merge them before trying to submit by the program.


### HTTP Errors

Remove the `gradescope-submit` config file by doing
`rm -r ~/.gradescope-submit`. Then, refer to the troubleshooting for incorrect
passwords and try it again.


## Special macOS Instructions

### Do you have a Mac running an older version of macOS?

Verify you're running an older version of macOS. Either click the Apple button in the menubar in the top-left and click "About This Mac", or else run `sw_vers` from the terminal.

Follow [the directions for macOS](#macos), but with some changes.

- Step 3.
  - Instead do `brew install ocaml opam`
- Step 10. Install OpenSSL.
  - Run `brew edit openssl`
  - Edit the file that's opened
    - NOTE: By default, Homebrew will put you in vim for this. If you're not familiar with vim: type `i` to switch to a regular editing mode, make the changes below, then (when you're done) hit `ESC` followed by `:wq`, then press `ENTER`.
    - Scroll to the line `args = %W[`
    - At the bottom of this list (which should have items like `--prefix=#{prefix}`, `--openssldir=#{openssldir}`, `no-ssl3`, etc), add a new line:
      - `-I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include`
    - Save and close the file.
    - You can look at [this Stack Overflow answer](https://stackoverflow.com/a/68990901/3377150) to see what it should look like.
  - Run `brew install openssl@1.1`
- Step 11. Install dependencies.
  - Run `brew install readline sqlite xz python@3.9 ninja meson libffi pcre glib sphinx-doc cmake jasper netpbm gts util-macros xtrans xcb-proto libpthread-stubs xorgproto libxau libxdmcp libxcp libx11 libxext libxrender lzo pixman cairo gobject-introspection libssh2 gdk-pixbuf fribidi graphite2 icu4c harfbuzz pango libtool automake gtk-doc pkgconfig`
- Step 12. Install librsvg from source.
  - Create a temporary directory: `mkdir /tmp/cmsc330`
  - Go there: `cd /tmp/cmsc330`
  - Clone the librsvg repository: `git clone https://gitlab.gnome.org/GNOME/librsvg.git`
  - Enter it: `cd librsvg`
  - Run `export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"`
  - Run the configuration script: `./autogen.sh --enable-gtk-doc`
  - Run `make`
  - Run `make install`
  - Leave the directory: `cd ..`
- Step 13. Install graphviz from source.
  - Download the archive: `curl -o graphviz.tz https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/2.49.0/graphviz-2.49.0.tar.gz`
  - Extract the archive: `tar -xzvf graphviz.tz`
  - Move into the created directory: `cd graphviz-2.49.0`
  - Run the configuration script: `./configure`
  - Run `make`
  - Run `make install`
- Step 14. Check it worked.
  - Assuming no errors came up, graphviz should now be installed.
  - Verify by doing `dot -V`
    - This should output a version number. If it says something like "command not found", something didn't go right.
