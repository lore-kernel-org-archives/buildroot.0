From: Charles Krinke <charles.krinke@gmail.com>
Date: Sun, 10 Apr 2011 16:08:05 -0700
Subject: [Buildroot] uclibc vs glibc
Message-ID: <BANLkTikSPG0y+0BnAxNrPedQLHWwFbAMEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a quesiton on a different subject and that is the difference between
uclibc and glibc from the MPC8323ERDB target viewpoint.

Here is what I think I know:
1. The toolchain is independent of the notion of uclibc vs glibc.
2. Several of the .so files in /lib on the target will be different between
uclibc and glibc.
3. An application needs to be compiled with the static (or dynamic)
libraries pertinent to glibc or uclibc with appropriate header files to
expect it to run on the target.

Questions:
1. Which .so files on the target are different? ld, libc, libstdc++ only, or
others?
2. Are the differing files on the target going to have the same names behind
their softlinks
 like ld.so.1->ld-2.11.1.so for instance?
3. Can I configure the CodeSourcery toolchain to produce a rootfs with
either uclibc or glibc and if so, what might be some of the steps?

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110410/1147ec6b/attachment.html>
