From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 22:14:59 +0100
Subject: [Buildroot] [PATCH next v2] putty: bump to version 0.68
In-Reply-To: <a7007f64e9741df5fd8750fc5fb9533b9f7ee559.1488304095.git.baruch@tkos.co.il>
References: <a7007f64e9741df5fd8750fc5fb9533b9f7ee559.1488304095.git.baruch@tkos.co.il>
Message-ID: <20170301221459.22edcef1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Feb 2017 19:48:15 +0200, Baruch Siach wrote:
> Drop upstream patches.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: update hash URL
> ---
>  package/putty/0001-uxcons-Fix-on-musl-libc.patch   | 29 ---------------------
>  ...02-Fix-__uint128_t-compile-error-on-MinGW.patch | 30 ----------------------
>  package/putty/putty.hash                           |  6 ++---
>  package/putty/putty.mk                             |  2 +-
>  4 files changed, 4 insertions(+), 63 deletions(-)
>  delete mode 100644 package/putty/0001-uxcons-Fix-on-musl-libc.patch
>  delete mode 100644 package/putty/0002-Fix-__uint128_t-compile-error-on-MinGW.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
