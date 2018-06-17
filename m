From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 21:26:58 +0200
Subject: [Buildroot] [PATCH 1/1] libtirpc: fix musl build
In-Reply-To: <20180610180532.19164-1-fontaine.fabrice@gmail.com>
References: <20180610180532.19164-1-fontaine.fabrice@gmail.com>
Message-ID: <20180617212658.69e2ce10@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jun 2018 20:05:32 +0200, Fabrice Fontaine wrote:
> Don't redefine existing typedef (u_char, u_long, ...) on musl
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/dbc07e383605a84eb19a2fd1899668612212518a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../libtirpc/0006-rpc-types.h-fix-musl-build.patch | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/libtirpc/0006-rpc-types.h-fix-musl-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
