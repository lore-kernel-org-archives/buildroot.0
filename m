From: Sasha Sirotkin <buildroot@browserseal.com>
Date: Wed, 31 Mar 2010 13:47:13 +0300
Subject: [Buildroot] init segfaults when compiled with glibc
Message-ID: <4BB32831.6080306@browserseal.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, Mar 30, 2010 at 11:34 PM, Thomas Petazzoni 
<thomas.petazzoni@free-electrons.com> wrote:

    Hi Sasha,

    On Tue, 30 Mar 2010 23:03:55 +0300
    Sasha Sirotkin <buildroot@browserseal.com> wrote:

    > It looks like glibc does not work at all with buildroot right now.
    > Should I open a bug ticket or something?

    Unfortunately, without more details, a bug report would be fairly
    useless. Can you send your Buildroot .config and kernel .config so that
    I can try to reproduce your problem on my AT91 systems ?

Attached please find both config files. 
Thanks.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot.config.bz2
Type: application/x-bzip
Size: 3643 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100331/a0cc21e1/attachment-0002.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernel.config.bz2
Type: application/x-bzip
Size: 7096 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100331/a0cc21e1/attachment-0003.bin>
