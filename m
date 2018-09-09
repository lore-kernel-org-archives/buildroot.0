From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:20:06 +0200
Subject: [Buildroot] [PATCH 1/1] acpid: depends on BR2_USE_MMU
In-Reply-To: <20180909104251.7870-1-fontaine.fabrice@gmail.com>
References: <20180909104251.7870-1-fontaine.fabrice@gmail.com>
Message-ID: <20180909152006.59879eff@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 12:42:51 +0200, Fabrice Fontaine wrote:
> acpid needs fork
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2cb0435d36a2aa2d75b6c1dfecc93bb49b0f6266
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/acpid/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
