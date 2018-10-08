From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 8 Oct 2018 10:29:58 +0200
Subject: [Buildroot] [PATCH 1/1] brltty: fix build on mips64el
In-Reply-To: <87bm84g8cf.fsf@home.blind.guru>
References: <20180930183408.4248-1-fontaine.fabrice@gmail.com>
 <87bm84g8cf.fsf@home.blind.guru>
Message-ID: <CAPi7W82H5K4nsu5A6wPwwuGdnTXAJJ3Jh5wUrkGRj93==6cBhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mario,
Le lun. 8 oct. 2018 ? 10:18, Mario Lang <mlang@blind.guru> a ?crit :

> Hi.
>
> Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
> > Bump to version 5.6 has reintroduced the issue fixed by patch 854093 on
> > version 5.5.
> >
> > Indeed, third patch was merged upstream but it was then reverted:
> >
> https://github.com/brltty/brltty/commit/9e7d62c869d3c1cbe12dda8b0291a4692c193416
> >
> > Moreover, since commit 3a2e3f6fa5ef0a210ffeba5ed05c79965d0cc3c7, MKOBJ
> > was renamed into MKREL. So, instead of patching again brltty, overwrite
> > LD to set the correct emulation depending on MIPS architecture as
> > already done in linux-tool-perf.mk.in.
>
> Thanks Fabrice.  ack and +1.
>
Thanks for your review, however after the feedback from Arnout on first
patch iteration (https://patchwork.ozlabs.org/patch/972614/), I've also
sent a PR to brltty: https://github.com/brltty/brltty/pull/149.
Both solutions seems good to me.

>
> --
> CYa,
>   ?????
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181008/951e0d27/attachment.html>
