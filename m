From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Jul 2018 16:32:52 +0200
Subject: [Buildroot] [git commit] kf5-modemmanager-qt: new package
In-Reply-To: <20180703030508.rjd2345rrh65gcbs@tarshish>
References: <20180702212055.3BA2784051@busybox.osuosl.org>
 <20180703030508.rjd2345rrh65gcbs@tarshish>
Message-ID: <20180703163252.10982a64@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 3 Jul 2018 06:05:08 +0300, Baruch Siach wrote:

> > +comment "kf5-modemmanager-qt needs toolchain w/ threads"
> > +	depends on BR2_USE_MMU
> > +	depends on !BR2_TOOLCHAIN_HAS_THREADS  
> 
> Shouldn't the comment also depend on BR2_PACKAGE_MODEM_MANAGER?

Completely correct. And this also applies to kf5-networkmanager-qt.

Thanks for pointing this out!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
