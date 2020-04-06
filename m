From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Apr 2020 07:21:59 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-04-04
In-Reply-To: <20200405105715.GA2143@curiosity>
References: <20200405062746.3ECF185F75@fraxinus.osuosl.org>
 <20200405105715.GA2143@curiosity>
Message-ID: <20200406072159.1254ced1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sergey,

On Sun, 5 Apr 2020 13:57:15 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> Today I received two bug reports for orange-pi-one and macchiatobin boards.
> In both cases the reason of failure is 'No space left on device'. I randomly
> picked several other board failures and the reason seems to be the same.

Thanks for reporting, I had also noticed the reason of those build
failures. They all happen on Mind's autobuilder, so I notified Arnout
Vandecappelle about this. Hopefully he will be able to resolve this
issue before the next Gitlab CI run on defconfigs.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
