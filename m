From: Woody Wu <narkewoody@gmail.com>
Date: Wed, 14 Nov 2012 22:57:19 +0800
Subject: [Buildroot] How to build Kernel 2.6.x
In-Reply-To: <201211141547.42502.yann.morin.1998@free.fr>
References: <k7vnmj$27j$1@ger.gmane.org> <20121114153158.5de351df@skate>
 <201211141547.42502.yann.morin.1998@free.fr>
Message-ID: <CAAsE_ucA-Gag0v-9g4AObY=yB4DZH7AEuvA3zkwGEvUPv5JgWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

? 2012-11-14 PM10:50?"Yann E. MORIN" <yann.morin.1998@free.fr>???
>
> Woody, All,
>
> On Wednesday 14 November 2012 15:31:58 Thomas Petazzoni wrote:
> > On Wed, 14 Nov 2012 17:19:15 +0800, woody wrote:
> >
> > > I want to build kernel version 2.6.16 for ARM (s3c2410).  The 2.6.16
is
> >
> > Why 2.6.16 ? This is prehistory.
>
> And 2.6.16 does not know hos to headers_install. That came with 2.6.18,
> and not even for all archs. IIRC, headers_install for arm was mostly
> working at 2.6.20-something.
>
> 2.6.16 is tool old. Upgrade, and bang on your provider to upgrade.
>

Thanks for telling the information. I will try 2.6.20 and see whether the
error disappear.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121114/2f9e7f5b/attachment.html>
