From: Jaap Crezee <jaap@jcz.nl>
Date: Thu, 19 May 2016 22:08:53 +0200
Subject: [Buildroot] host-lzop failing when host is using gcc-6
Message-ID: <ba2ba1aa-3774-89b9-f8bf-270bc3ebac78@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


host-lzop seems to be failing when Archlinux switched to gcc-6.x 
recently. One can see the attached logfile. Anybody willing to 
investigate? I don't have time at the moment.
HOSTCC=gcc-4.8 bypasses the issue for me...


regards,


Jaap Crezee
-------------- next part --------------
A non-text attachment was scrubbed...
Name: host-lzop.log
Type: text/x-log
Size: 2488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160519/428db00a/attachment.bin>
