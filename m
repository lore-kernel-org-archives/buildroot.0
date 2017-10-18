From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 22:29:06 +0200
Subject: [Buildroot] [PATCH] powertop: needs autoreconf
In-Reply-To: <dac9c0cd9a627b5c5500de6779f4aeca43fd0989.1508349837.git.baruch@tkos.co.il>
References: <dac9c0cd9a627b5c5500de6779f4aeca43fd0989.1508349837.git.baruch@tkos.co.il>
Message-ID: <20171018222906.458550aa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 21:03:57 +0300, Baruch Siach wrote:
> Commit 01048deab60 (package/powertop: bump to version 2.9) removed
> autoreconf even though the remaining patch touches Makefile.am. Fix
> this.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3bf/3bf8daee559e2978f8602c56397afda771299032/
> http://autobuild.buildroot.net/results/f9b/f9b4f113a333107a972fa51bd0347eeb0d52496f/
> http://autobuild.buildroot.net/results/067/0675826888b6f89e76291c7835839344300ca9f5/
> 
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Steven Noonan <steven@uplinklabs.net>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/powertop/powertop.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master after tweaking the comment to mention exactly which
patch requires autoreconf, as suggested by Romain.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
