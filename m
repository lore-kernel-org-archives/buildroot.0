From: Remco Poelstra <r.poelstra@vogels.com>
Date: Wed, 21 Feb 2018 15:47:34 +0000
Subject: [Buildroot] Start daemon from eudev with Busybox init system
Message-ID: <AM3PR02MB312173A6AF15DE4EB01D15AEFCE0@AM3PR02MB312.eurprd02.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I need to start a daemon when the 'hci0' device becomes available, but (e)udev can't be used to run long-lasting processes.
All solutions on the internet seem to use systemd to solve this problem, but I'm using the busybox init system.
Does busybox/buildroot have some kind of provision for this?

Thanks in advance.

Kind regards,

Remco Poelstra
*Nosig*

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180221/bbf86b08/attachment.html>
