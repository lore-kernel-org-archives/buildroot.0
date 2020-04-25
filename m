From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 22:16:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtdev2tuio: fix build with musl
 1.2.0
In-Reply-To: <20200425104816.1229406-1-fontaine.fabrice@gmail.com>
References: <20200425104816.1229406-1-fontaine.fabrice@gmail.com>
Message-ID: <20200425221618.67ddb474@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Apr 2020 12:48:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/a30823f1388f37820d8a4f29b9b2c1de9b3992ac
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...dev2tuio.c-fix-build-with-musl-1.2.0.patch | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/mtdev2tuio/0002-mtdev2tuio.c-fix-build-with-musl-1.2.0.patch

Applied to master, thanks. However, this project hasn't seen any commit
since 2012. Is it still relevant/useful ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
