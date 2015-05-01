From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:45:12 +0200
Subject: [Buildroot] [PATCH v7 03/13] gpu-viv-bin-mx6q: make fb/x11
 choice explicit
In-Reply-To: <1430406748-8493-4-git-send-email-jezz@sysmic.org>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-4-git-send-email-jezz@sysmic.org>
Message-ID: <20150501164512.5880b4a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 30 Apr 2015 17:12:18 +0200, J?r?me Pouiller wrote:
> This approach is less error-prone during development.
> 
> Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
> Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/freescale-imx/gpu-viv-bin-mx6q/Config.in   | 23 ++++++++++++++++++++--
>  .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |  2 +-
>  2 files changed, 22 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
