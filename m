From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 22:05:27 +0100
Subject: [Buildroot] [PATCH 1/6] toolchain-external: remove stale
 references to (ARCH_)LIBC_A_LOCATION
In-Reply-To: <20170131160343.27144-2-patrickdepinguin@gmail.com>
References: <20170131160343.27144-1-patrickdepinguin@gmail.com>
 <20170131160343.27144-2-patrickdepinguin@gmail.com>
Message-ID: <20170201220527.14fad935@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Jan 2017 17:03:38 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The variables LIBC_A_LOCATION and ARCH_LIBC_A_LOCATION were killed in commit
> 646bd86908f7f995cdc2b95e0be381d97600f905 but the corresponding descriptions
> were never removed.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  .../toolchain-external/pkg-toolchain-external.mk   | 30 ++++++++--------------
>  1 file changed, 11 insertions(+), 19 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
