From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:51:37 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 4.17.1
In-Reply-To: <8c998542bd25e65a58ebe3732dd74a4b7c434e2a.1535027897.git.baruch@tkos.co.il>
References: <8c998542bd25e65a58ebe3732dd74a4b7c434e2a.1535027897.git.baruch@tkos.co.il>
Message-ID: <20180824235137.11234063@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Aug 2018 15:38:17 +0300, Baruch Siach wrote:
> The configure script now detects toolchain support for the -std=gnu90
> flag. This fixes build with gcc older than 4.5.
> 
> Should fix:
> http://autobuild.buildroot.net/results/802/802dd4d7eec058c2eb23e033ed3a093b110f4eda/
> 
> Cc: Robert J. Heywood <robert.heywood@codethink.co.uk>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
