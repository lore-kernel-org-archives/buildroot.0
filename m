From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 4 Sep 2008 12:00:18 +1000
Subject: [Buildroot] Login exited
In-Reply-To: <ed4892840809031850y32161b46qc99547711ab535a7@mail.gmail.com>
References: <ed4892840809010102n6293e75ejc6caf1dd57a954db@mail.gmail.com>
	<ed4892840809011747w183e8e8bma1451d38c40e65c0@mail.gmail.com>
	<200809031950.49148.vda.linux@googlemail.com>
	<ed4892840809031850y32161b46qc99547711ab535a7@mail.gmail.com>
Message-ID: <20080904020018.GC16933@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 04, 2008 at 09:50:01AM +0800, Steven Woody wrote:
> Okay, we leave this 'decompressing' error for a moment.  I rebuilt

Actually on second reading I think that is a result of trying to mount
configfs on /config, and nothing to do with the root filesystem itself.

> (mostly using default options from buildroot) a very small rootfs
> image, 780k cramfs.  This time, it boots without the 'decompressing'
> error message, I still can not login in.  It's same: whatever user
> name I inputed, the getty restarted and I get nothing but another
> prompt.
> 
> If you experts can not guess what's is going on here, I hope you can
> tell me how to debug this kind of problem.  Tks.

Did you try booting with init=/bin/sh as I suggested two days ago? Or
modify your inittab to present you with a shell without needing to
login? This will help to break down the problem dramatically.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
