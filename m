From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 3 Sep 2008 11:00:06 +1000
Subject: [Buildroot] Login exited
In-Reply-To: <ed4892840809020810h71632bfdh370015793ae688f5@mail.gmail.com>
References: <ed4892840809011747w183e8e8bma1451d38c40e65c0@mail.gmail.com>
	<MJEBLBOLLBKOACLOGNPBGEIHCBAA.e.krueper@solcon-systemtechnik.de>
	<ed4892840809020426s36489484t7ca0a5dd2863733e@mail.gmail.com>
	<20080902130749.GA12634@cloud.net.au>
	<ed4892840809020809r69eb6383wda4db62d49058959@mail.gmail.com>
	<ed4892840809020810h71632bfdh370015793ae688f5@mail.gmail.com>
Message-ID: <20080903010006.GD7857@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 02, 2008 at 11:10:27PM +0800, Steven Woody wrote:
> On Tue, Sep 2, 2008 at 11:09 PM, Steven Woody <narkewoody@gmail.com> wrote:
> >> Maybe you could boot your system with the command line "init=/bin/sh" so
> >> that it skips all start up scripts and see what happens?
> >
> > Okay, I will try next when I go office.
> 
> sorry, I forgot to ask: where to put the command line?

Your boot loader should allow you to specify the command line to the
kernel. Or the default is set as a kernel configuration option - run
"make linux-menuconfig" etc.

Which boot loader are you using? U-Boot, RedBoot, ... ?

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
