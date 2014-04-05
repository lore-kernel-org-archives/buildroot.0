From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 14:44:45 +0200
Subject: [Buildroot] [PATCH] gmp: fix target build for ARM thumb
In-Reply-To: <1396648140-16883-1-git-send-email-gustavo@zacarias.com.ar>
References: <1396648140-16883-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140405144445.3956ad75@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  4 Apr 2014 18:49:00 -0300, Gustavo Zacarias wrote:
> Pull upstream hg changeset c56ea318eb64 and 676e2d0f0e4d to fix ARM
> build breakage when compiling in thumb mode. Fixes:
> http://autobuild.buildroot.net/results/f44/f447ce933ad8dd975b17aeda03cc46b0cace0b03/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../gmp-01-arm-asm-conditional-on-no-thumb-1.patch  | 21 +++++++++++++++++++++
>  .../gmp-02-arm-asm-conditional-on-no-thumb-2.patch  | 21 +++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 package/gmp/gmp-01-arm-asm-conditional-on-no-thumb-1.patch
>  create mode 100644 package/gmp/gmp-02-arm-asm-conditional-on-no-thumb-2.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
