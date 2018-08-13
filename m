From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 09:36:09 -0500
Subject: [Buildroot] Analysis of build results for 2018-08-11
In-Reply-To: <20180812223629.2bac8ebe@windsurf>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
Message-ID: <CANQCQpbDmecDS1LE8HY46y1BnEtJH=cRsmo7KEbZhsNZvHhquw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hollis / Thomas,
On Sun, Aug 12, 2018 at 3:36 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Matt, Hollis, Romain, J?rg, Bernd, there are some questions for you
> below.
>
> On Sun, 12 Aug 2018 08:00:15 +0200 (CEST), Thomas Petazzoni wrote:
>
[snip]
> Hollis, this is happening only on your autobuilder, could you have a
> look: http://autobuild.buildroot.net/?reason=host-cryptsetup%.
>
> >       x86_64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/e48c974980b8228302a76ac5b6afad14e7ce81c1 |
>

Require host gcc at least 4.7
http://patchwork.ozlabs.org/patch/957001/
