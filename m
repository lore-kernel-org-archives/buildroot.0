From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 21:12:42 +0200
Subject: [Buildroot] [PATCH 1/1] vlc: fix build on or1k
In-Reply-To: <20180910215451.13910-1-fontaine.fabrice@gmail.com>
References: <20180910215451.13910-1-fontaine.fabrice@gmail.com>
Message-ID: <20180912211242.47e4fb66@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Sep 2018 23:54:51 +0200, Fabrice Fontaine wrote:
> vlc 3.0.4 is also affected by gcc bug internal compiler error on or1k
> 
> hw/vaapi/vlc_vaapi.c: In function 'pool_pic_destroy_cb':
> hw/vaapi/vlc_vaapi.c:568:1: internal compiler error: in merge_overlapping_regs, at regrename.c:304
>  }
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/771e88e7fb06714dd4b7246f82b95dffcedde343
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/vlc/vlc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
