From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 11:29:40 +0100
Subject: [Buildroot] [PATCH] glibc: add debug symbols when
 BR2_ENABLE_DEBUG
In-Reply-To: <5517167ba77f268eeeaa8c5763078aeeb53741c6.1420107403.git.baruch@tkos.co.il>
References: <5517167ba77f268eeeaa8c5763078aeeb53741c6.1420107403.git.baruch@tkos.co.il>
Message-ID: <20150101112940.0d1859fa@free-electrons.com>
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

Thanks!

Do you know if there's an easy way of checking if ELF binaries have
debugging symbols? If so, we could add a check to verify that all ELF
binaries have debugging symbols when BR2_ENABLE_DEBUG=y, and add this
check in the autobuilders.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
