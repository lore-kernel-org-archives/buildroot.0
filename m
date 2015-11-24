From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Nov 2015 17:40:06 +0100
Subject: [Buildroot] [PATCH next] gmp: bump to version 6.1.0
In-Reply-To: <1448382253-21279-1-git-send-email-gustavo@zacarias.com.ar>
References: <1448382253-21279-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151124174006.42710311@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 24 Nov 2015 13:24:12 -0300, Gustavo Zacarias wrote:
> Patches are upstream so drop them.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0001-arm-asm-conditional-on-no-thumb-1.patch   | 21 ---------------------
>  .../0002-arm-asm-conditional-on-no-thumb-2.patch   | 21 ---------------------
>  ...c-provide-default-bmod-to-mod-threshold-1.patch | 22 ----------------------
>  package/gmp/gmp.hash                               |  2 +-
>  package/gmp/gmp.mk                                 |  2 +-
>  5 files changed, 2 insertions(+), 66 deletions(-)
>  delete mode 100644 package/gmp/0001-arm-asm-conditional-on-no-thumb-1.patch
>  delete mode 100644 package/gmp/0002-arm-asm-conditional-on-no-thumb-2.patch
>  delete mode 100644 package/gmp/0003-powerpc-provide-default-bmod-to-mod-threshold-1.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
