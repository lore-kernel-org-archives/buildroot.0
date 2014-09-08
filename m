From: Sylvain LG <forum@sylvainlegourr.com>
Date: Mon, 8 Sep 2014 16:34:33 +0200
Subject: [Buildroot] patching issue
Message-ID: <CAK9TtU22PKEbOF2KPRnps=oT+jt=b3rCh1zkCbqDO9rrAHyV-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've just launched a compilation from latest buildroot sources.

Here comes an issue:

Applying busybox-0005-busybox-1.22.1-nc.patch using patch:
> patching file networking/nc_bloaty.c
> make: *** No rule to make target `package/busybox/busybox-1.22.x.config',
> needed by `/home/username/buildroot/output/build/busybox-1.22.1/.config'.
> Stop.


What can I do?


Thank you,


Sylvain
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140908/c53eba90/attachment.html>
