From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 22:26:57 +0200
Subject: [Buildroot] [PATCH v3 for-next 1/5] arch: add
 BR2_ARCH_NEEDS_GCC_AT_LEAST_8
In-Reply-To: <20180529215257.17686-1-romain.naour@gmail.com>
References: <20180529215257.17686-1-romain.naour@gmail.com>
Message-ID: <20180530222657.29aba33b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 May 2018 23:52:53 +0200, Romain Naour wrote:
> This new symbol will be used by architectures introduced with gcc 8 and
> by external toolchains based on gcc 8.
> 
> [1] https://gcc.gnu.org/gcc-8/changes.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  arch/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Thanks, I've applied this series to the next branch!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
