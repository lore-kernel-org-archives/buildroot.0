From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jun 2018 22:27:51 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] aircrack-ng: fix build on powerpc64 with libgcrypt
In-Reply-To: <20180602193008.31633-1-fontaine.fabrice@gmail.com>
References: <20180602193008.31633-1-fontaine.fabrice@gmail.com>
Message-ID: <20180602222751.329d70d5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jun 2018 21:30:08 +0200, Fabrice Fontaine wrote:
> Retrieved patch from upstream:
> https://github.com/aircrack-ng/aircrack-ng/issues/1874
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/3d92343342b51e710765866d6dd9383d26ba98e7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
> - Fix typo in title: aircrack-ng instead of arcrack-ng

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
