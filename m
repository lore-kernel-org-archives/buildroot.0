From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 16 Feb 2019 15:49:34 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-02-13
In-Reply-To: <20190215144942.GB27633@momiji>
References: <20190214070044.6825F2152B@silver.osuosl.org>
 <20190214100244.GB15212@momiji> <20190214093947.3949384d@windsurf>
 <20190215021300.GB25351@momiji> <87a7ixgvkd.fsf@dell.be.48ers.dk>
 <20190215144942.GB27633@momiji>
Message-ID: <20190216154934.GC9363@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Feb 2019 14:49:42 +0200, Adrian Perez de Castro <aperez@igalia.com> wrote:
> On Fri, 15 Feb 2019 12:06:26 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:
> > >>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
> > 
> > Hi,
> > 
> >  >> Yes, if the issue no longer happens with gcc >= 7.x, it seems like a
> >  >> reasonable option.
> > 
> >  > At this point I don't know what to do; I don't see any proposed patch to
> >  > apply to GCC, and I never touched Microblaze before.
> > 
> >  > I guess disabling the Brotli package for Microblaze wouldn't be an option...
> >  > or would it?
> > 
> > If it doesn't build, then that is IMHO the only sensible thing to
> > do. Given that brotli has very few reverse dependencies (and there is
> > probably no realistic usecase for webkit on microblaze) it is OK.
> > 
> > Will you send a patch?
> 
> Will do, thanks for the feedback :)

Sent: https://patchwork.ozlabs.org/project/buildroot/list/?series=92432

This would be worth merging to ?next? as well, and in there it would be
good to also disable the WOFF2 support for th wpewebkit package. Is it
better to merge to apply this same patch set to ?next? and then I submit
a follow up for that, or is it better that I prepare a version of this
patch set with one extra commit for the wpewebkit package?

Cheers,

-Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190216/68923be2/attachment.asc>
