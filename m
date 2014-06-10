From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Tue, 10 Jun 2014 11:11:24 -0500
Subject: [Buildroot] Upgrading my defconfig
Message-ID: <CAE9DZUS6HUUFpt-Rm-WONCcx5_4y+F+8TtcPFYzuNCfiraq83Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,  Would someone kindly guide me through the steps of upgrading my
defconfig?  It's a few years out of date.  I've upgraded the rest of
buildroot itself, and when I try to save my defconfig the makefile
complains bitterly:

$ make savedefconfig
Makefile.legacy:12: *** "You have legacy configuration in your .config!
Please check your configuration.".  Stop.

I tried "make oldconfig" and "make olddefconfig".  Neither seemed to do
anything.

I have attached a copy of my config for your reference.

Thanks,

Dallas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140610/03038f4e/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buffalo_ts3000_defconfig
Type: application/octet-stream
Size: 7798 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140610/03038f4e/attachment.obj>
