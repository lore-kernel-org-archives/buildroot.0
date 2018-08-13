From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 10:30:04 -0500
Subject: [Buildroot] Analysis of build results for 2018-08-11
In-Reply-To: <CANQCQpbDmecDS1LE8HY46y1BnEtJH=cRsmo7KEbZhsNZvHhquw@mail.gmail.com>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
 <CANQCQpbDmecDS1LE8HY46y1BnEtJH=cRsmo7KEbZhsNZvHhquw@mail.gmail.com>
Message-ID: <CANQCQpZ2mVuPkeeiR5yxKf3Cs7xUiADuO0dAMkZxsLaCa_iQCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,
On Mon, Aug 13, 2018 at 9:36 AM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Hollis / Thomas,
> On Sun, Aug 12, 2018 at 3:36 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > Matt, Hollis, Romain, J?rg, Bernd, there are some questions for you
> > below.
> >
> > On Sun, 12 Aug 2018 08:00:15 +0200 (CEST), Thomas Petazzoni wrote:
> >
> [snip]
> > Hollis, this is happening only on your autobuilder, could you have a
> > look: http://autobuild.buildroot.net/?reason=host-cryptsetup%.
> >
> > >       x86_64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/e48c974980b8228302a76ac5b6afad14e7ce81c1 |
> >
>
> Require host gcc at least 4.7
> http://patchwork.ozlabs.org/patch/957001/

v2.  http://patchwork.ozlabs.org/project/buildroot/list/?series=60561

I've also opened a upstream ticket
https://github.com/SELinuxProject/selinux/issues/97.  We'll see if I
can get traction there and maybe that determines kconfig vs patch?

Matt
