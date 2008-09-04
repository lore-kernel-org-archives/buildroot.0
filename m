From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 5 Sep 2008 00:29:12 +1000
Subject: [Buildroot] Login exited
In-Reply-To: <ed4892840809032234h62607fb2oac8847e3da884e44@mail.gmail.com>
References: <ed4892840809010102n6293e75ejc6caf1dd57a954db@mail.gmail.com>
	<ed4892840809011747w183e8e8bma1451d38c40e65c0@mail.gmail.com>
	<200809031950.49148.vda.linux@googlemail.com>
	<ed4892840809031850y32161b46qc99547711ab535a7@mail.gmail.com>
	<20080904020018.GC16933@cloud.net.au>
	<ed4892840809032234h62607fb2oac8847e3da884e44@mail.gmail.com>
Message-ID: <20080904142912.GB28250@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 04, 2008 at 01:34:14PM +0800, Steven Woody wrote:
> On Thu, Sep 4, 2008 at 10:00 AM, Hamish Moffatt <hamish@cloud.net.au> wrote:
> > Did you try booting with init=/bin/sh as I suggested two days ago? Or
> > modify your inittab to present you with a shell without needing to
> > login? This will help to break down the problem dramatically.
> 
> I did init=/bin/sh as you suggested and reported the result to the
> list.  Again, the result is:  there is nothing I can do after rootfs
> was loaded by kernel.  I can type in characters can see the echo of
> what I typed on the screen, but no any other outputs.  Does this has
> something to do with my read-only file system type (cramfs)?

I didn't see your posting. Do you get a prompt? Do you get any messages
at all after the kernel loads, loads the RAM disk, etc? Please post the
whole log.

No I don't see how the root file system being read-only would be
significant. cramfs is always read-only. I build cramfs here with
buildroot and it works just fine.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
