From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 22:40:22 +0200
Subject: [Buildroot] [PATCH v2] beaglebone: Bump U-Boot version
In-Reply-To: <1465232735-32705-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1465075749-31837-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1465232735-32705-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20160606224022.707e7ae1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Jun 2016 14:05:35 -0300, Ezequiel Garcia wrote:
> Currently selected version of U-Boot fails to compile.
> Dying words are:
> 
>   gcc -g -O2 -I/home/zeta/buildroot/buildroot/output/host/usr/include -c -o env_embedded.o /home/zeta/buildroot/buildroot/output/build/uboot-2013.10/common/env_embedded.c
>   /home/zeta/buildroot/buildroot/output/build/uboot-2013.10/lib/crc32.c:14:20: fatal error: common.h: No such file or directory
>   compilation terminated.
>   Makefile:258: recipe for target 'crc32.o' failed
> 
> Since it's quite old, instead of trying to fix it, let's
> just upgrade.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
> Changes from v1:

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
