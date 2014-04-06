From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 14:18:39 +0200
Subject: [Buildroot] [PATCH v7] toolchain: control vendor part in
 GNU_TARGET_NAME
In-Reply-To: <884EA965490E3C4D8E66AEF41E9802500C0F90@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E9802500C0F90@ezex10.ezchip.com>
Message-ID: <20140406141839.0624420d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Noam Camus,

On Tue, 1 Apr 2014 06:25:47 +0000, Noam Camus wrote:
> From: Noam Camus <noamc@ezchip.com>
> 
> This option allows to customize the "vendor" part of the
> toolchain tuple, where the toolchain tuple has the form
> <arch>-<vendor>-<os>-<libc>. Use this option in situations
> where gcc might make different decisions based on the vendor
> part of the tuple.
> 
> Signed-off-by: "Noam Camus" <noamc@ezchip.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/Makefile.in                     |   17 ++++++++++++++++-
>  toolchain/toolchain-buildroot/Config.in |   16 ++++++++++++++++
>  2 files changed, 32 insertions(+), 1 deletions(-)

Applied, thanks. I've moved the config option at a slightly different
place, because the location you had chosen was confusing: the option
was between the selection of the C library, and the options for the
selected C library.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
