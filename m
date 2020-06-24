From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 21:55:43 +0200
Subject: [Buildroot] [PATCH 3/5] arch: add BR2_ARCH_NEEDS_GCC_AT_LEAST_10
In-Reply-To: <20200608221347.2639059-3-romain.naour@gmail.com>
References: <20200608221347.2639059-1-romain.naour@gmail.com>
 <20200608221347.2639059-3-romain.naour@gmail.com>
Message-ID: <20200624215543.44bb06e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  9 Jun 2020 00:13:45 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> This new symbol will be used by architectures introduced with gcc 10 and
> by external toolchains based on gcc 10.
> 
> [1] https://gcc.gnu.org/gcc-10/changes.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  arch/Config.in             | 4 ++++
>  package/gcc/Config.in.host | 1 +
>  2 files changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
