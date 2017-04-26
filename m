From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Apr 2017 10:02:15 +0200
Subject: [Buildroot] [PATCH] xorriso: disable libcdio
In-Reply-To: <0a5dac7516bd86eca86510a190385617af60d738.1492891844.git.baruch@tkos.co.il>
References: <0a5dac7516bd86eca86510a190385617af60d738.1492891844.git.baruch@tkos.co.il>
Message-ID: <20170426100215.66dfc389@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Apr 2017 23:10:44 +0300, Baruch Siach wrote:
> xorriso and libcdio define identically named symbols. This breaks static
> linking.
> 
> Besides, upstream suggested that on Linux the built-in libburn adapter is much
> better tested than libcdio.
> 
> Disable libcdio.
> 
> Fixes:
> http://autobuild.buildroot.net/results/430/430a6b548fcc311f20ea71cecaa11fafac1d5a19/
> http://autobuild.buildroot.net/results/a5d/a5d0f8bec0d39e48f6dfe4ecc07fe0ca3c6bd70a/
> 
> Cc: Steve Kenton <skenton@ou.edu>
> Suggested-by: Thomas Schmitt <scdbackup@gmx.net>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/xorriso/xorriso.mk | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
