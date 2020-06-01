From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2020 22:06:50 +0200
Subject: [Buildroot] [PATCH] board/freescale: increase the vfat size
In-Reply-To: <20200526210119.6143-1-festevam@gmail.com> (Fabio Estevam's
 message of "Tue, 26 May 2020 18:01:19 -0300")
References: <20200526210119.6143-1-festevam@gmail.com>
Message-ID: <875zcah7ol.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > i.MX8 targets typically use the standard ARM64 defconfig, which builds
 > lots of ARM64 platforms leading to super large kernels that can easily
 > not fit within the current 32MB size for vfat.

 > Increase the vfat size to better accomodate such large kernels.

 > Signed-off-by: Fabio Estevam <festevam@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
