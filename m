From: Nigel Sollars <nsollars@gmail.com>
Date: Mon, 21 Jan 2013 08:19:22 -0500
Subject: [Buildroot] buildroot gcc for target build fail
Message-ID: <CAG6aBkWm1gHehkXDcscL1Jn+nHwM-u7uG_9dEwS6hSmQgwLCaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

After trying to build a more upto date buildroot I seemed to encounter this
issue

--

checking whether to use setjmp/longjmp exceptions... unknown
configure: error: unable to detect exception model
make[2]: *** [configure-target-libgcc] Error 1
make[2]: Leaving directory
`/usr/local/buildroot-src/source/buildroot-2013.01/output/build/gcc-4.7.2-target'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/usr/local/buildroot-src/source/buildroot-2013.01/output/build/gcc-4.7.2-target'
make: ***
[/usr/local/buildroot-src/source/buildroot-2013.01/output/build/gcc-4.7.2-target/.compiled]
Error 2

--

I have supplied the configuration file I am using in hopes that replicating
the issue will be made easier.

Thanks in advance

Nigel

-- 
?Science is a differential equation. Religion is a boundary condition.?

Alan Turing
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130121/c86f2b69/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config-2013.01
Type: application/octet-stream
Size: 30516 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130121/c86f2b69/attachment-0001.obj>
