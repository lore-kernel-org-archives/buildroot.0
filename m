From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 22:14:52 +0200
Subject: [Buildroot] [PATCH v2] toolchain/toolchain-common.in: update
 definition of BR2_TOOLCHAIN_HAS_GCC_BUG_64735 for GCC 7
In-Reply-To: <20170606195207.6634-1-joerg.krause@embedded.rocks>
References: <20170606195207.6634-1-joerg.krause@embedded.rocks>
Message-ID: <20170606221452.1124cdce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Jun 2017 21:52:07 +0200, J?rg Krause wrote:
> As GCC 7 is now available in Buildroot, update the definition for
> BR2_TOOLCHAIN_HAS_GCC_BUG_64735 as the bug #64735 is fixed in GCC 7.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> v2:
>  - simplify logic (suggested by Thomas)
> ---
>  toolchain/toolchain-common.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
