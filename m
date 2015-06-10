From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jun 2015 09:38:42 +0200
Subject: [Buildroot] [PATCH 2/2] infra/pkg-kconfig: require an non-empty
 KCONFIG_FILE
In-Reply-To: <c5c81694cabca70c5651fe42a7de99247275659c.1428512591.git.yann.morin.1998@free.fr>
References: <cover.1428512591.git.yann.morin.1998@free.fr>
 <c5c81694cabca70c5651fe42a7de99247275659c.1428512591.git.yann.morin.1998@free.fr>
Message-ID: <20150610093842.289707b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  8 Apr 2015 19:08:35 +0200, Yann E. MORIN wrote:
> Currently, we only check that the variable is defined, which is not
> enough since we really want it to be non-empty.
> 
> We however can't check it points to an existing file, because the
> package might well not be extracted yet, and we may use an internal
> defconfig. If that file does not eventually exist, there will be a
> failure down the road at build time when we try to copy it...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  package/pkg-kconfig.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
