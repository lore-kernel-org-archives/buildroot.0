From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 16:31:32 +0200
Subject: [Buildroot] [PATCH 00/12] package/udisks: bump version to 2.9.0
In-Reply-To: <20200723010810.3237608-1-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
Message-ID: <20200723163132.0c0c1688@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Jul 2020 18:07:58 -0700
aduskett at gmail.com wrote:

> After successfully compiling in Fedora 32, I loaded up CentOS7 with confidence.
> Of course, my confidence was my undoing, and udisks immediately choked on
> trying to build due to CentOS7 having an ancient pre-spidermonkey polkit.
> After a few hours of fiddling around, I finally figured out what the issue
> was, added host variants of spidermonkey and polkit, and then added
> host-polkit as a dependency to udisks and everything compiled cleanly.

Do you have more details about what it does with host-polkit? Indeed,
having to build host-spidermonkey and host-polkit is quite a big hammer :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
