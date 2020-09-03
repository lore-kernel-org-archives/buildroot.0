From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 20:44:03 +0200
Subject: [Buildroot] [PATCH v4 1/2] package/bmap-tools: new package
In-Reply-To: <20191105125039.1443-1-nicolas.carrier@orolia.com>
References: <20191105125039.1443-1-nicolas.carrier@orolia.com>
Message-ID: <20200903204403.72304c2d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nicolas,

On Tue, 5 Nov 2019 12:51:09 +0000
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> I need bmap-tools on the target since it's what our flashing / upgrade procudure
> uses to speed up the process (flashing ~8GB disk images full of zeroes).
> 
> Changes v3 -v4:
>   - added the upstream URL to the package's help
> 
> Changes v2 -> v3:
>   - double-checked that setuptools is required by bmap-tools at runtime too
>   - moved the "v" from BMAP_TOOLS_VERSION to BMAP_TOOLS_SITE (in the .hash too)
>   - changed license name from GPLv2 to GPL-2.0
> 
> Changes v1 -> v2:
>   - no change
> 
> ---
> 
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>

This patch series received some significant review and comments from
Romain Naour, but you haven't posted a v5. I've marked the v4 as
Changes Requested, which means that if you don't send a v5, we will
unfortunately forget about this contribution.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
