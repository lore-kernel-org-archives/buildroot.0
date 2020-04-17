From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 23:13:14 +0200
Subject: [Buildroot] [PATCH v3 0/3] configs,board: add OLPC XO laptops
In-Reply-To: <20200416095954.364163-1-lkundrak@v3.sk>
References: <20200416095954.364163-1-lkundrak@v3.sk>
Message-ID: <20200417231314.614a76d8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lubomir,

On Thu, 16 Apr 2020 11:59:51 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> With few consumer distros remaining to support the Geode-based systems,
> let alone optimize for them, Buildroot is a very handy way to make good
> use of a rather uniquely engineered XO-1 laptop. Also, with 5.3 kernel,
> the XO-1.75 is in a pretty good shape.

Thanks, I have applied your patches. One thing that was not good is
that the kernel version was not explicitly specified, while we always
do this in our defconfigs to ensure that the kernel version being built
has been tested by someone, instead of using just the default latest
kernel. I assumed you had tested with Linux 5.6, since it is currently
the latest.

Another thing that would be nice to have is a board/olpc/readme.txt,
which gives some details on how to use the defconfigs, and especially
how to flash/boot the resulting system on the hardware. See other
readme.txt files in board/ for some examples.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
