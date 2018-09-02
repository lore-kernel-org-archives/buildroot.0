From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Sep 2018 23:20:55 +0200
Subject: [Buildroot] [PATCH/next,1/2] jpeg-turbo: fix static build
In-Reply-To: <20180826172313.19644-1-fontaine.fabrice@gmail.com>
References: <20180826172313.19644-1-fontaine.fabrice@gmail.com>
Message-ID: <20180902232055.0cac5d41@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Aug 2018 19:23:12 +0200, Fabrice Fontaine wrote:
> Set ENABLE_STATIC and ENABLE_SHARED depending on
> BR2_PACKAGE_STATIC_LIBS, BR2_SHARED_SHARED_STATIC_LIBS and
> BR2_SHARED_SHARED_LIBS
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/7e1500405a0f102dd6a48ef9337ffe4d7de73df3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/jpeg-turbo/jpeg-turbo.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to next, thanks. Please follow-up with upstream on the second
patch: they asked you more details about it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
