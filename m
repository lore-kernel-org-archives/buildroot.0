From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Nov 2017 22:12:22 +0100
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.14.1
In-Reply-To: <9307d429db0bf9d7d141aa49ddc2e72425460882.1510684057.git.baruch@tkos.co.il>
References: <9307d429db0bf9d7d141aa49ddc2e72425460882.1510684057.git.baruch@tkos.co.il>
Message-ID: <20171115221222.70b83a27@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Nov 2017 20:27:37 +0200, Baruch Siach wrote:
> Remove uClibc build fix; current uClibc version defines the required
> macro.
> 
> Remove static link fix; fixed upstream.
> 
> Rebase the musl libc-compat.h workaround to adapt to upstream headers
> location change.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...musl-workaround-to-the-libc-compat.h-copy.patch |  16 ++--
>  .../iproute2/0002-Fix-build-with-uClibc-ng.patch   |  38 --------
>  .../0003-lib-fix-multiple-strlcpy-definition.patch | 103 ---------------------
>  package/iproute2/iproute2.hash                     |   2 +-
>  package/iproute2/iproute2.mk                       |   2 +-
>  5 files changed, 10 insertions(+), 151 deletions(-)
>  delete mode 100644 package/iproute2/0002-Fix-build-with-uClibc-ng.patch
>  delete mode 100644 package/iproute2/0003-lib-fix-multiple-strlcpy-definition.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
