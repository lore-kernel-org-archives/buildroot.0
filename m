From: Will Buik <willbuik@gmail.com>
Date: Tue, 7 Nov 2006 15:28:10 -0500
Subject: [Buildroot] Cross compiling GRUB 1.95
Message-ID: <1d09f8b80611071228r15abebc9k152444a6c512b1ac@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have gotten the buildroot cross compiler working to compile some
simple programs, but when trying to compile GRUB 1.95 I am running
into errors.  The configure script fails, giving me the error:

checking if GCC has the regparm=3 bug... configure: error: cannot run
test program while cross compiling

I sent a message similar to this to the grub message board several
days ago but I have gotten no response.  After looking it up on the
internet it said to try to use a newer version of autoconf to
regenerate the packaged configure script, but this did not solve my
problem.

How can I bypass this test or otherwise get it to compile?
