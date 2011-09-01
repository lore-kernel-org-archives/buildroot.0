From: Mohamed Mohamed Nour El-Din Hassib <eng.mohamed.nour.eldin@gmail.com>
Date: Thu, 1 Sep 2011 09:54:48 +0200
Subject: [Buildroot] Incorrect selection of the C library
Message-ID: <CAL7CV-cF7QedAikQ35GoJ_FBpAkzhYVwyBbz-6bu7BPu0pwJqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to build a filesystem & I'm using an external toolchain,

This toolchain was made using ELDK with glibc as the C library, so in the
toolchain config, I specify the external toolchain's path & select "glibc"
for the C library field,

When trying "make", I get:
*Checking external toolchain settings*
*Incorrect selection of the C library*
*
*
So can you help me with this?

Thanks,
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110901/3c83117b/attachment.html>
