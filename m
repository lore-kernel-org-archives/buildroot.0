From: David H. Lynch J.r <ml@dlasys.net>
Date: Wed, 29 Jul 2009 12:06:49 -0400
Subject: [Buildroot] Cygwin PPC Build Possible ?
Message-ID: <4A707399.2030401@dlasys.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


    I am trying to use buildroot to create a ppc-405-linux-uClibc
toolchain.

    Currently I am getting a weird failure building gmp-4.2.4-host
    the error is something like
        configure:1 can't find CollabNet/files
    Sorry I am in linux at the moment so I do nto have the exact error.
    Regardless it seems to be some kind of cygwin script handling issue.

    Has anyone succeeded in running buildroot under cygwin ?
    Any hints or suguestions ?
    I am using cygwin 1.5 and very recent buildroot from git.

    What about mingw32/msys rather than cygwin ?

    Or any other way to build a somewhat moder ppc-405 windows/linux 
uClibc cross compiler ?
