From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 21:49:59 +0200
Subject: [Buildroot] [PATCH] ola: remove package
In-Reply-To: <9bcbb3a321628ffd33521b6558185a373ec60bff.1496080955.git.baruch@tkos.co.il>
References: <9bcbb3a321628ffd33521b6558185a373ec60bff.1496080955.git.baruch@tkos.co.il>
Message-ID: <20170529214959.4a0af486@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 May 2017 21:02:35 +0300, Baruch Siach wrote:
> ola does not build with current protobuf. Upstream bug report is still open.
> 
> https://github.com/OpenLightingProject/ola/issues/1192
> 
> Cc: Dave Skok <blanco.ether@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  DEVELOPERS                                         |   3 -
>  package/Config.in                                  |   1 -
>  .../0001-Remove-fvisibiliy-inlines-hidden.patch    |  26 ---
>  .../ola/0002-Remove-replacing-I-with-isystem.patch | 106 ------------
>  package/ola/Config.in                              | 138 ----------------
>  package/ola/ola.hash                               |   2 -
>  package/ola/ola.mk                                 | 180 ---------------------
>  7 files changed, 456 deletions(-)
>  delete mode 100644 package/ola/0001-Remove-fvisibiliy-inlines-hidden.patch
>  delete mode 100644 package/ola/0002-Remove-replacing-I-with-isystem.patch
>  delete mode 100644 package/ola/Config.in
>  delete mode 100644 package/ola/ola.hash
>  delete mode 100644 package/ola/ola.mk

Applied to master, thanks. I think we should also remove the "firejail"
package, which has been marked BROKEN for a while, with nobody taking
care of it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
