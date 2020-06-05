From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 5 Jun 2020 08:22:08 +0200
Subject: [Buildroot] [PATCH 2/2] package/rt-tests: bump to version 1.8
In-Reply-To: <87pnae5icv.fsf@tarshish>
References: <7bacd6259e057a8bb62f0b7654842b43da630aec.1591278848.git.baruch@tkos.co.il>
 <845009b0378d6f3117f361661fe59a40540fe419.1591278848.git.baruch@tkos.co.il>
 <20200604225902.2845af93@windsurf> <87pnae5icv.fsf@tarshish>
Message-ID: <20200605082208.1a475b4b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 05 Jun 2020 05:58:24 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> > What ensures rt-tests is not built for SH ?  
> 
> numactl does not support SH, so the BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS
> 'depends on' prevents rt-tests from being built for SH.

Ah, right, I missed that. Thanks for clarifying!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
