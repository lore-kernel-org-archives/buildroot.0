From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 2 Sep 2018 15:58:35 +0200
Subject: [Buildroot] [PATCH] package/squashfs: fix build on hosts with
 glibc >= 2.28
In-Reply-To: <a178b07f64674107d4db38b4fc4eb21c2e44bfe1.camel@web.de>
References: <20180825200751.28097-1-richard.kunze@web.de>
 <20180827063731.m3xm4jamqyugxfwm@sapphire.tkos.co.il>
 <a178b07f64674107d4db38b4fc4eb21c2e44bfe1.camel@web.de>
Message-ID: <CAAXf6LVsOyTQyB-XZSjm=-_5TxPkJzTxC2uhcPiv_RjTTEK8vw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

El s?b., 1 sept. 2018 a las 17:01, Richard Kunze
(<richard.kunze@web.de>) escribi?:
>
> Hi Baruch,
>
> thanks for your comments, I'll do a V2. But I'm not altogether sure how
> to go about it - see below.
>
> Am Montag, den 27.08.2018, 09:37 +0300 schrieb Baruch Siach:
> >
> > Patches should have a description and sign-off. See the patches
> > chapter in the
> > Buildroot manual:
> >
> >   https://buildroot.org/downloads/manual/manual.html#patch-policy
> >
> > It would also be nice to add a note about the upstream status of this
> > patch.
>
> The problem here is I don't really know how to contact upstream.
>
> The Buildroot makefile references
> https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git but that
> has no bug tracker or contact information for patches. The original (?)
> site at sourceforge.net seems pretty much dead.
>
> I finally found https://github.com/plougher/squashfs-tools which seems
> at least somewhat active, and there is already a pull request for the
> same problem: https://github.com/plougher/squashfs-tools/pull/52
>

I recently learned that the squashfs GitHub page is not actually used
for development and pull requests there are likely to be ignored.
I will resubmit the patch to the corresponding mailing list from
kernel.org. Hopefully there is more reaction there...

Thanks for importing it into Buildroot, I planned to do it but did not
yet execute :-)

/Thomas
