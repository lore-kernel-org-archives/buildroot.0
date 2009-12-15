From: Luca <lucarx76@gmail.com>
Date: Tue, 15 Dec 2009 06:31:39 -0800
Subject: [Buildroot] buildroot and perl
Message-ID: <3d87aabd0912150631h12666de9m611f6339f2a76fee@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
 this might be a stupid question I keep getting the following error after
make with buildroot

Can't locate Config.pm in @INC (@INC contains ...)

(same for Socket.pm, XSLoader.pm and DynaLoader.pm).

With locate I can see I have them on my workstation but they are in
different paths. I tried creating symbolic links, and I passed this problem
but I got a different one

"Can't load module Socket, dynamic loading not available in this perl"

With perl -V I can see I have perl 5.10.0 on my workstation, while buildroot
uses 5.8.8

How can I fix this problem?

I actually do not need perl, I just need ssh/scp/sfp/dhcpd

Thank you in advance.
 Luca
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091215/53fe5398/attachment.htm>
