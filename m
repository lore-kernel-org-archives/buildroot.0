From: daniel wilson <daniel.a.wilson@gmail.com>
Date: Thu, 25 Feb 2010 14:21:02 +0000
Subject: [Buildroot] buildroot for older uClibc
Message-ID: <fa63ee051002250621t4e0c2cbdk94c9dfa165a297d8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm working with a legacy embedded platform which has some closed binaries
that are linked against uClibc 0.9.28.  Much as I would like to bring this
platform up-to-date, I'm reliant on these utilities for the correct
operation of various bits of hardware.  To cut a long story short, I think
I'm going to have to build myself a toolchain which links against uClibc
0.9.28 to produce software for this platform.

I've downloaded various older versions of buildroot, but none of them seem
to have this version of uClibc as an option.

Please can someone point me in the right direction ?

Many thanks in advance,

Dan Wilson.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100225/232ae122/attachment.htm>
