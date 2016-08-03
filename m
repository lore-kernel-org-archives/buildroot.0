From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Aug 2016 10:18:15 +0200
Subject: [Buildroot] How to login automatically without typing root in
 buildroot x86 64 QEMU?
In-Reply-To: <CAFXrp_cSim7KTWQNGPgOLtaym1REtQfpR4THLrX8hMmZwQ-wpA@mail.gmail.com>
References: <CAFXrp_e2sDqZGZKM_B2rgBuh_1oXWhJgW6wgMzfBWsGQ_hnV7g@mail.gmail.com>
 <20160802094112.072e3382@free-electrons.com>
 <CAFXrp_cSim7KTWQNGPgOLtaym1REtQfpR4THLrX8hMmZwQ-wpA@mail.gmail.com>
Message-ID: <20160803101815.43ad8074@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 Aug 2016 08:52:48 +0100, Ciro Santilli wrote:

> Is editing `package/busybox/inittab` the best way to do it?

No.

> Or is there a more specific `.config` option? I know about
> BR2_ROOTFS_OVERLAY.

Yes, use an overlay to install your custom version of inittab. Or
alternatively, a post-build script to tweak the inittab at the end of
the build.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
