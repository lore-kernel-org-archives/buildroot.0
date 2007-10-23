From: Jorge S. <jorgesolla@gmail.com>
Date: Tue, 23 Oct 2007 20:32:47 +0200
Subject: [Buildroot] Busybox minicom-like application?
Message-ID: <6090c5eb0710231132k5146e947r48e3deeedc4b7599@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all:

 I'm building my rootfs and i need a minicom-like application, googling
around i've found that "microcom" is what i need.

My problem comes when trying to "select" microcom on the buildroot menu, it
is hidden if i select the "[*] Hide applications that are provided by
busybox " option, so i assume busybox is providing some "microcom/minicom"
like command.

Just made a "make busybox-menuconfig" and i'm unable to find any option for
a minicom/microcom similar program.
I'm using the default (package/busybox/busybox-1.6.0.config ) busybox
config.

Any ideas on how to enable/install this application?

Thanks in advance.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071023/4f70046d/attachment.htm 
