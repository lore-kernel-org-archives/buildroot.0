From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 17:32:37 +0200
Subject: [Buildroot] Beaglebone_qt5_defconfig (Beaglebone Black)
In-Reply-To: <CAPru4TU0nZ4DbQu1_PGmUiEcUijy1uRr3WHeXw-cCjsM23QMmQ@mail.gmail.com>
References: <CAPru4TU0nZ4DbQu1_PGmUiEcUijy1uRr3WHeXw-cCjsM23QMmQ@mail.gmail.com>
Message-ID: <20180630173237.2c87bbc8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Einar in Cc, who worked on updating ti-sgx-km and the
beaglebone_qt5_defconfig.

On Sat, 30 Jun 2018 16:23:49 +0100, Ola Oni wrote:

> I am currently using the attached beaglebone_qt5_defconfig I learnt from
> someone on the IRC channel that this is more likely a OpenGL issue rather
> than buildroot issue but I don't know how to go about solving this issue.

I am kos_tom on IRC, and therefore the "someone" mentioned in this
paragraph.

What I told you on IRC is to apply the patch
https://patchwork.ozlabs.org/patch/919942/.

I did this myself, and the result is something that doesn't build, i.e
the ti-sgx-km package does not build. How did you solve that first ?

I no longer have the logs unfortunately, I would need to restart a
fresh build. I started updating the ti-sgx-km module again, but ran out
of time to continue.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
