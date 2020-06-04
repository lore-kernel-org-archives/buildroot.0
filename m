From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 22:59:02 +0200
Subject: [Buildroot] [PATCH 2/2] package/rt-tests: bump to version 1.8
In-Reply-To: <845009b0378d6f3117f361661fe59a40540fe419.1591278848.git.baruch@tkos.co.il>
References: <7bacd6259e057a8bb62f0b7654842b43da630aec.1591278848.git.baruch@tkos.co.il>
 <845009b0378d6f3117f361661fe59a40540fe419.1591278848.git.baruch@tkos.co.il>
Message-ID: <20200604225902.2845af93@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  4 Jun 2020 16:54:08 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Drop patch #1. libnuma is now a mandatory dependency. The ostype and
> machinetype variables are not used for the Linux target.
> 
> Drop patch #3. SH is not a supported target architecture anymore.

What ensures rt-tests is not built for SH ?

But anyway, I've applied to master, if it needs to be fixed, a
follow-up patch will do that.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
