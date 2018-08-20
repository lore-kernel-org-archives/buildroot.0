From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 20 Aug 2018 10:57:54 -0500
Subject: [Buildroot] uboot-tools autobuilder failure
Message-ID: <CANQCQpYFZMAwUs=moym1oc4GCjH6C8AHbDpOueL0r3+c3==BJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hollis, I don't have a machine old enough to debug this failure.
What's weird is the target uboot-tools is being built with a GCC6/7
which should support -std=gnu11, however we get a cc1: error:
unrecognized command line option "-std=gnu11".

http://autobuild.buildroot.net/?reason=uboot-tools-2018.07

Would you mind running a
https://git.busybox.net/buildroot-test/tree/utils/br-reproduce-build
on one of those build hashes and when it fails drop into the output
folder and run a make V=1?  Then paste that back here?

Matt
