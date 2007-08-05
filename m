From: Alan Carvalho de Assis <acassis@gmail.com>
Date: Sun, 5 Aug 2007 17:51:39 +0000
Subject: [Buildroot] Problems compiling tinyx package
Message-ID: <37367b3a0708051051t6a4bc568r13b9f990e2e33127@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guys,
some months ago I compiled the tinyx package from buildroot (selecting
gcc 3.4.2), but in recent buildroot versions it is not comping tinyx.

I have tested buildroot selecting gcc 3.4.6 and 4.x.x with no success.
If tinyx package is not selected the buildroot compilation goes fine.

The error just appear when buildroot try to copy Xvfb binary because
it is no there.

My host system is Debian sid. Also tested on Ubuntu 7.04 with same results.

Can someone here test this package to verify if the same error occur?

Cheers,

Alan
