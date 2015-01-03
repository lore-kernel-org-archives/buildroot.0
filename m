From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jan 2015 21:41:08 +0100
Subject: [Buildroot] [PATCH] package/upx: needs zlib
In-Reply-To: <1420302307-12399-1-git-send-email-yann.morin.1998@free.fr>
References: <1420302307-12399-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150103214108.033992fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  3 Jan 2015 17:25:07 +0100, Yann E. MORIN wrote:
> Fixes build issues like, observed on a stripped-down build system:
>     compress.cpp:32:18: fatal error: zlib.h: No such file or directory
>      #include <zlib.h>
>                   ^
>     compilation terminated.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/upx/upx.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
