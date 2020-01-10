From: Markus Mayer <mmayer@broadcom.com>
Date: Fri, 10 Jan 2020 14:35:37 -0800
Subject: [Buildroot] Kconfig warnings with GCC9
In-Reply-To: <20200110215652.291df299@windsurf>
References: <CAGt4E5su1GkK+5ghxC9x9G9KNizC-5jm5E58qPKkDXKuDu5CqQ@mail.gmail.com>
 <20200110215652.291df299@windsurf>
Message-ID: <CAGt4E5u+KA3Vi0dp+YRAYnvXSJN1XXF=S86Th4NoyamnQSWpiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Jan 2020 at 12:56, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri, 10 Jan 2020 11:17:47 -0800
> Markus Mayer <mmayer@broadcom.com> wrote:
>
> > Hi all,
> >
> > Using GCC9 (Ubuntu 19.10), I am getting some compiler warnings
> > (potential buffer overruns) in the Kconfig code. Is this a known
> > issue?
>
> You can try to update the kconfig code in Buildroot with the kconfig
> code available from the latest kernel, and see if it fixes the
> warnings. We're currently using the kconfig code from 4.17-rc2 it seems.

I'll give it a shot.

Regards,
-Markus

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
