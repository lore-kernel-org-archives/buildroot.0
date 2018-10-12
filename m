From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 12 Oct 2018 13:58:14 -0500
Subject: [Buildroot] Clang libsanitizer
Message-ID: <CANQCQpZHKtsQxYOZGGyboMHQQMsaRA_oMuMPvqXDEuXghXscFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm starting to work with the libfuzzer
(https://github.com/google/fuzzer-test-suite) project and was
wondering if you've looked at adding the compiler-rt package to
Buildroot?  It looks like that would require some additional changes
to the Clang package and a generic pkg type for compiler-rt which
would cross build the libraries for use. (maybe the start of a set of
hooks for llvm/clang building of packages)

Matt
