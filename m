From: Nicholas Walton <nwalton@aplopteng.com>
Date: Fri, 20 Nov 2009 14:36:16 -0800
Subject: [Buildroot] help
In-Reply-To: <3617236271557503935@unknownmsgid>
References: <3617236271557503935@unknownmsgid>
Message-ID: <b680c1c10911201436o718d1e1cv828216724bdc222c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 20, 2009 at 10:15 AM, Jens Kleinhans <jens.kleinhans@gmx.de> wrote:
> Hello,
>
> I?m trying to build the buildroot with the explanation on linux4Sam.

Much of the information about buildroot on Linux4SAM is not relevant
to the current versions of buildroot and the kernel. A good first step
is to go through buildroot menuconfig and linux26-menuconfig, select
the AT91SAM9260 and AT91SAM9260EK options, leave everything else set
to defaults, and build.

Nicholas

> I need it for Crosscompiling the Kernel for an ARM Board AT91SAM9260 from Atmel.
>
> Is there a HOW To or any aid for the configuration for this board?
>
> If you got a HOW TO or some helping information it would be kind if you send it to me.
>
> With kind regards
>
> Jens
