From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Sep 2009 19:30:48 +0200
Subject: [Buildroot] [PATCH 1/6] Remove the "project" feature
In-Reply-To: <20090917161713.GA4647@mx.loc>
References: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1253135266-26880-2-git-send-email-thomas.petazzoni@free-electrons.com>
	<20090917161713.GA4647@mx.loc>
Message-ID: <20090917193048.65e365e5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 17 Sep 2009 18:17:13 +0200,
Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> a ?crit :

> That find is gross. $(wildcard $(TOPDIR)/target/*/$(@)_defconfig)
> and we have $(Q) that is either set to '@' or is empty.
> Apart from that a failing oldconfig is and should be fatal.

Thanks for noticing. Will fix in another patch.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
