From: =?UTF-8?B?0KLQuNC80YPRgCDQn9GA0L7QutC+0L/QtdC90LrQvg==?= <prok.tim26@gmail.com>
Date: Thu, 25 Oct 2018 11:16:35 +0300
Subject: [Buildroot] alsa-utils: alsactl services are not installed
Message-ID: <CANTMe2UJhVMgxj+mSX+XiNkv=Qzb6H3rQhDOphpV7=7xVB-HYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to build Buildroot with systemd. alsa-utils seem to install
correctly but the alsa-restore and alsa-state services aren't installed to
the target directory but to the host directory only.

It's very weird since simply copying the service files to the target
directory and installing the resulting image works properly. Is there any
problem with the Makefile? Using systemd v239 with alsa-utils v1.1.5

Thank you in advance.
-- 
Best regards,
Prokopenko T.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181025/5b966b4c/attachment.html>
