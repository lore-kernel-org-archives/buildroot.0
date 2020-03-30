From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 08:56:42 +0200
Subject: [Buildroot] [PATCH] package/evtest: fix build with musl 1.2.0
In-Reply-To: <fbc996280a1db8d4984fe4ecec2361cd2148641a.1585295125.git.baruch@tkos.co.il>
References: <fbc996280a1db8d4984fe4ecec2361cd2148641a.1585295125.git.baruch@tkos.co.il>
Message-ID: <20200330085642.78899a08@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 27 Mar 2020 10:45:25 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Add upstream patch fixing issue with 64-bit time_t introduced in musl
> 1.2.0 for 32-bit architectures.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0847ef68b7f7bffa3083229ad9523dbad28db4f2/
> http://autobuild.buildroot.net/results/73355877a945d3555350bea3bef70dfa68b80018/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...ld-on-32bit-arches-with-64bit-time_t.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/evtest/0002-Fix-build-on-32bit-arches-with-64bit-time_t.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
