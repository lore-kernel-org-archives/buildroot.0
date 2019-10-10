From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:38:56 +0200
Subject: [Buildroot] [PATCH v2 3/4] imx6-sabresd/readme.txt: Improve Qt5
 Cinematic Demo instructions
In-Reply-To: <20191009170004.3542-3-festevam@gmail.com>
References: <20191009170004.3542-1-festevam@gmail.com>
 <20191009170004.3542-3-festevam@gmail.com>
Message-ID: <20191010223856.230ec412@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  9 Oct 2019 14:00:03 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> QT_QPA_EGLFS_ALWAYS_SET_MODE=1 needs to be exported, otherwise the Qt5
> Cinematic demo throws a storm of the following messages:
> 
> Could not queue DRM page flip on screen LVDS1 (Invalid argument)
> 
> Improve the instructions by mentioning such requirement.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - None

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
