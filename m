From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:45:26 +0200
Subject: [Buildroot] [PATCH v7 06/13] gpu-viv-bin-mx6q: change output
 selection mechanism
In-Reply-To: <1430406748-8493-7-git-send-email-jezz@sysmic.org>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-7-git-send-email-jezz@sysmic.org>
Message-ID: <20150501164526.18436be8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 30 Apr 2015 17:12:21 +0200, J?r?me Pouiller wrote:
> Move output selection to Config.in. It easier to add new backends selection
> (wayland, directfb, ...).
> 
> Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/freescale-imx/gpu-viv-bin-mx6q/Config.in           | 5 +++++
>  package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 8 +-------
>  2 files changed, 6 insertions(+), 7 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
