From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Tue, 10 Jun 2014 12:30:50 -0500
Subject: [Buildroot] Upgrading my defconfig
In-Reply-To: <CAE9DZUS6HUUFpt-Rm-WONCcx5_4y+F+8TtcPFYzuNCfiraq83Q@mail.gmail.com>
References: <CAE9DZUS6HUUFpt-Rm-WONCcx5_4y+F+8TtcPFYzuNCfiraq83Q@mail.gmail.com>
Message-ID: <CAE9DZURoq1+6tbvNOkt=kWZ8rvQOZjYsT5meF3y0kFtLGJ+aoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please ignore.  I was able to figure out how to do this.


On Tue, Jun 10, 2014 at 11:11 AM, Dallas Clement <dallas.a.clement@gmail.com
> wrote:

> Hi All,  Would someone kindly guide me through the steps of upgrading my
> defconfig?  It's a few years out of date.  I've upgraded the rest of
> buildroot itself, and when I try to save my defconfig the makefile
> complains bitterly:
>
> $ make savedefconfig
> Makefile.legacy:12: *** "You have legacy configuration in your .config!
> Please check your configuration.".  Stop.
>
> I tried "make oldconfig" and "make olddefconfig".  Neither seemed to do
> anything.
>
> I have attached a copy of my config for your reference.
>
> Thanks,
>
> Dallas
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140610/84eeefa1/attachment.html>
