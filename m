From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:45:22 +0200
Subject: [Buildroot] [PATCH v7 05/13] gpu-viv-bin-mx6q: add version in
 libraries symlinks
In-Reply-To: <1430406748-8493-6-git-send-email-jezz@sysmic.org>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-6-git-send-email-jezz@sysmic.org>
Message-ID: <20150501164522.4b204212@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 30 Apr 2015 17:12:20 +0200, J?r?me Pouiller wrote:
> Create libraries symbolic links with version numbers.
> 
> This now matches what is done in Yocto:
> https://github.com/Freescale/meta-fsl-arm/blob/dizzy/recipes-graphics/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.inc#L165
> 
> Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
> Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
