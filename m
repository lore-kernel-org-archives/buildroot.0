From: Sylvain LG <forum@sylvainlegourr.com>
Date: Sat, 4 Oct 2014 12:38:15 +0200
Subject: [Buildroot] how to restart network interface automatically
Message-ID: <CAK9TtU2PL8yxy=6Exn_-wTVE9z-TdEhD9tw-FL=LG165D2p+cg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

my network interface eth0 is configured to use DHCP.

At boot time, init script S40network starts the network. And if DHCP server
- for any reason - can't answer, no IP will be set for eth0.

What will be the correct strategy to handle this case?

Best regards,

Sylvain
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141004/23346f26/attachment.html>
