From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 5 Sep 2008 11:07:58 +1000
Subject: [Buildroot] Login exited
In-Reply-To: <ed4892840809040849x7505c56ft98135e1535dc0fcc@mail.gmail.com>
References: <ed4892840809010102n6293e75ejc6caf1dd57a954db@mail.gmail.com>
	<ed4892840809011747w183e8e8bma1451d38c40e65c0@mail.gmail.com>
	<200809031950.49148.vda.linux@googlemail.com>
	<ed4892840809031850y32161b46qc99547711ab535a7@mail.gmail.com>
	<20080904020018.GC16933@cloud.net.au>
	<ed4892840809032234h62607fb2oac8847e3da884e44@mail.gmail.com>
	<20080904142912.GB28250@cloud.net.au>
	<ed4892840809040849x7505c56ft98135e1535dc0fcc@mail.gmail.com>
Message-ID: <20080905010758.GA22747@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've dropped the Cc to the busybox list and vda as it's unlikely to be a
busybox fault.

On Thu, Sep 04, 2008 at 11:49:38PM +0800, Steven Woody wrote:
> On Thu, Sep 4, 2008 at 10:29 PM, Hamish Moffatt <hamish@cloud.net.au> wrote:
> > I didn't see your posting. Do you get a prompt? Do you get any messages
> > at all after the kernel loads, loads the RAM disk, etc? Please post the
> > whole log.
> >
> > No I don't see how the root file system being read-only would be
> > significant. cramfs is always read-only. I build cramfs here with
> > buildroot and it works just fine.
> >
> > Hamish
> 
> Hi, Hamish
> 
> Below are the whole boot message, and I like to say sorry to other
> peoples here for the reposting.

Hi Steven,

I didn't see anything significant in the logs. It was badly line-wrapped
by gmail which didn't help - I suggest attaching a log file instead of
pasting it in in future. Thanks.

So what of my questions above?
> > I didn't see your posting. Do you get a prompt? Do you get any messages
> > at all after the kernel loads, loads the RAM disk, etc? 

Do you have a full log of the session where you booted with
init=/bin/sh?


cheers
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
