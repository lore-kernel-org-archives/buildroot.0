From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:24:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/nftables: fix build with gcc <=
 4.8
In-Reply-To: <20200607214113.4107523-1-fontaine.fabrice@gmail.com>
References: <20200607214113.4107523-1-fontaine.fabrice@gmail.com>
Message-ID: <20200610232442.102ecb82@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Jun 2020 23:41:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/cf2359b8311fe91f9335c91f2bb4a730c9f4c9dc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-src-main.c-fix-build-with-gcc-4.8.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/nftables/0001-src-main.c-fix-build-with-gcc-4.8.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
