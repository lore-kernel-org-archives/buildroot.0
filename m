From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Aug 2018 10:57:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/polkit: bump version to 1.105
In-Reply-To: <20180801074108.8926-1-apanfilov@spectracom.com>
References: <20180801074108.8926-1-apanfilov@spectracom.com>
Message-ID: <20180801105740.6d5ba467@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Aug 2018 10:41:08 +0300, Artem Panfilov wrote:
> Fixes build issue with network-manager package when polkit package is
> enabled.
> 
> Signed-off-by: Artem Panfilov <apanfilov@spectracom.com>

Is this version still independent from the Javascript stuff that newer
versions need ? I thought we were stuck to 0.103 because of the
dependency of newer versions on MozJS.

Could you comment on this ?

Also, do you have a defconfig that exhibits the issue. I'm surprised
our autobuilders haven't found any build issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
