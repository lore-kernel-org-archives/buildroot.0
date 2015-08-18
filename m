From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 13:05:38 +0200
Subject: [Buildroot] [PATCH] toolchain/external: ensure gcc version is
 known
In-Reply-To: <1439468003-27047-1-git-send-email-yann.morin.1998@free.fr>
References: <1439468003-27047-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150818130538.55e63112@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 13 Aug 2015 14:13:23 +0200, Yann E. MORIN wrote:
> Currently, when a preconfigured prebuilt toolchain forgets to specify
> its gcc version, the error message is a bit misleading, like:
> 
>     Incorrect selection of gcc version: expected .x, got 4.9.2
> 
> Add a an explicit check for the gcc version being set, that reports a
> better error message.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Note: we do not need the same check for kernel headers, because for
> those, we really ensure a version is set, namely 2.6.x, whereas we do
> not set a default 'REALLY_OLD' gcc version (and we can't really do so).
> ---
>  toolchain/helpers.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
