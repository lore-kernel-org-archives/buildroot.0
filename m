From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 21:39:33 +0100
Subject: [Buildroot] [PATCH 1/1] olimex_a20_olinuxino_lime2: dump U-Boot
 to 2016.05
In-Reply-To: <20161109132739.7861-1-viktorin@rehivetech.com>
References: <20161109132739.7861-1-viktorin@rehivetech.com>
Message-ID: <20161109213933.1ac48aec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Nov 2016 14:27:39 +0100, Jan Viktorin wrote:
> The patch fixes build by GCC 5 (unsupported by the older U-Boot).
> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  configs/olimex_a20_olinuxino_lime2_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, after fixing the commit title: s/dump/bump/.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
