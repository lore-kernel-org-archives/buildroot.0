From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 22:40:47 +0200
Subject: [Buildroot] [RFC 1/2] configs: raspberrypi3: fix mismatch cpu
 arch
In-Reply-To: <20170416151409.7665-2-gael.portay@savoirfairelinux.com>
References: <20170416151409.7665-1-gael.portay@savoirfairelinux.com>
 <20170416151409.7665-2-gael.portay@savoirfairelinux.com>
Message-ID: <20170502224047.0e8d2310@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Apr 2017 11:14:08 -0400, Ga?l PORTAY wrote:
> The raspberrypi3 is powered by a Broadcom BCM2837 which is a Cortex-A53.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  configs/raspberrypi3_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, I have applied https://patchwork.ozlabs.org/patch/757022/
instead, which was a little bit more complete, but essentially does the
same thing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
