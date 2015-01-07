From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 23:00:32 +0100
Subject: [Buildroot] [PATCH] glibc: add debug symbols when
 BR2_ENABLE_DEBUG
In-Reply-To: <5517167ba77f268eeeaa8c5763078aeeb53741c6.1420107403.git.baruch@tkos.co.il>
References: <5517167ba77f268eeeaa8c5763078aeeb53741c6.1420107403.git.baruch@tkos.co.il>
Message-ID: <20150107230032.0609cc78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu,  1 Jan 2015 12:16:43 +0200, Baruch Siach wrote:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/glibc/glibc.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks!

Maybe we should also take care of the same thing in uClibc? musl is OK,
we use $(TARGET_CFLAGS).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
