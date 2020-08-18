From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 16:42:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/libunwind: fix build with gcc 10
In-Reply-To: <20200817170228.2453117-1-fontaine.fabrice@gmail.com>
References: <20200817170228.2453117-1-fontaine.fabrice@gmail.com>
Message-ID: <20200818164211.1571579e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Aug 2020 19:02:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/dad61a90a27a97f275efd238ee22be704eab0063
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0003-Fix-compilation-with-fno-common.patch | 445 ++++++++++++++++++
>  1 file changed, 445 insertions(+)
>  create mode 100644 package/libunwind/0003-Fix-compilation-with-fno-common.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
