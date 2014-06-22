From: Javier Domingo Cansino <javierdo1@gmail.com>
Date: Sun, 22 Jun 2014 22:14:27 +0200
Subject: [Buildroot] [PATCH v2] Rewriting instructions to generate a
 zedboard image to be really verbose
In-Reply-To: <20140622220801.2d8b4b15@free-electrons.com>
References: <1402343887-12278-1-git-send-email-javierdo1@gmail.com>
 <1403303331-14450-1-git-send-email-javierdo1@gmail.com>
 <20140622220801.2d8b4b15@free-electrons.com>
Message-ID: <CALZVapku3Gib1LpriX6WrW923f4vreKUBqr7XZWFTXj4RYv99Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nice! I indeed forgot to put the -s option.
El 22/06/2014 14:08, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
escribi?:

> Dear Javier Domingo Cansino,
>
> On Sat, 21 Jun 2014 00:28:51 +0200, Javier Domingo Cansino wrote:
> > ---
> > Changes v1 -> v2:
> >   - Rewrote messages as suggested by spenser
> > ---
> >  board/avnet/zedboard/readme.txt |   62
> ++++++++++++++++++++++++++++++++-------
> >  1 file changed, 52 insertions(+), 10 deletions(-)
>
> Thanks, applied, after fixing the grammar issue noticed by Spenser,
> adding your SoB line (I assumed you SoB'ed your patch since it was the
> case in its v1), and adjusting the commit title.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140622/0268d49d/attachment.html>
