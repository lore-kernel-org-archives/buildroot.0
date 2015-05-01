From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:45:16 +0200
Subject: [Buildroot] [PATCH v7 04/13] gpu-viv-bin-mx6q: remove useless
 build time deps
In-Reply-To: <1430406748-8493-5-git-send-email-jezz@sysmic.org>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-5-git-send-email-jezz@sysmic.org>
Message-ID: <20150501164516.21d3c803@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 30 Apr 2015 17:12:19 +0200, J?r?me Pouiller wrote:
> Since gpu-viv-bin-mx6q is provided as binary package, there is no build
> time dependencies.
> 
> Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
> Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/freescale-imx/gpu-viv-bin-mx6q/Config.in           | 4 ++--
>  package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 1 -
>  2 files changed, 2 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
