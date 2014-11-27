From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:39:11 +0100
Subject: [Buildroot] [PATCH 3/4] gpu-amd-bin-mx51: install examples
In-Reply-To: <1415375874-17331-4-git-send-email-jezz@sysmic.org>
References: <1415375874-17331-1-git-send-email-jezz@sysmic.org>
 <1415375874-17331-4-git-send-email-jezz@sysmic.org>
Message-ID: <20141127223911.1be14d24@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri,  7 Nov 2014 16:57:53 +0100, J?r?me Pouiller wrote:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/freescale-imx/gpu-amd-bin-mx51/Config.in           | 5 +++++
>  package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk | 8 ++++++++
>  2 files changed, 13 insertions(+)

I am not sure that a separate patch is really needed for this, it could
be part of the patch adding the package itself.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
