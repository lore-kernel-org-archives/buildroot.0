From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 09:00:03 +0100
Subject: [Buildroot] [PATCH] keepalived: fix build with 4.15+ kernel
 headers
In-Reply-To: <1b8c72598111d5bbdbd34631afb2f75682871d6d.1518171153.git.baruch@tkos.co.il>
References: <1b8c72598111d5bbdbd34631afb2f75682871d6d.1518171153.git.baruch@tkos.co.il>
Message-ID: <20180210090003.7829e95b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Feb 2018 12:12:33 +0200, Baruch Siach wrote:
> Kernel version 4.15 change the logic of libc-compat.h in a way that
> introduced libc/kernel network headers collision. Add a patch for fixing
> that.
> 
> Fixes:
> http://autobuild.buildroot.net/results/000/000293275076c59e298d235e93ce9a92b66360e7/
> http://autobuild.buildroot.net/results/2ba/2ba8722a42aa9b92f5194595f53130c97647b9b8/
> http://autobuild.buildroot.net/results/114/114136447c9b18436ff9b2804c440a2e37576452/
> 
> Cc: Ilias Apalodimas <apalos@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...Fix-build-with-Linux-kernel-headers-v4.15.patch | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/keepalived/0001-Fix-build-with-Linux-kernel-headers-v4.15.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
