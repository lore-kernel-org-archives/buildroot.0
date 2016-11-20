From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 20 Nov 2016 08:36:33 +0100
Subject: [Buildroot] How to log /dev/console directly on the device
Message-ID: <CAGm1_ksb_gKjVwQ6S1AsnuREk439QTP9nbjRzhc7BMv7YY+y2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I need to log the output from /dev/console to a file. The purpose is
to find an application crash in a field. It is important to have all
possible messages i.e. kernel messages and application messages.

In field there is no physical access to a console, but if connected
the conole still should work as usual.

What options do I have?

Regards,
Yegor
