From: Kevin Broch <kevbroch@gmail.com>
Date: Tue, 7 Aug 2012 18:18:56 -0700
Subject: [Buildroot] building native gcc for target
Message-ID: <CAKWKLJCPCYuYteR7s6xrUgBH6j5aOfn28431eeSQeGqVT5Z3=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm am looking to build a complete (gcc too) development environment on the
target (arm) but currently don't see that this is possible.
I have tried all 3 toolchain types (buildroot, cross-ng, external (linaro),
but regardless I don't find gcc in output/target/usr/bin/gcc
I am wondering if I am missing something?

If not I am looking for any pointer on how I might do this (having never
created a buildroot package).
Ideally I would like to create a package that compiles Linaro GCC:
https://wiki.linaro.org/WorkingGroups/ToolChain/Using/GCCNative
I am imagining leveraging what is used to generate other tools like gdb,
binutils, and trying to incorporate the various machine options (VFP,
softfloat, etc)
in the configure options.

Any pointers would be appreciated.

Best, /<evin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120807/634fb4bd/attachment.html>
