From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 13:12:41 +0200
Subject: [Buildroot] [PATCH 1/4] toolchain/external: bump Linaro ARM to
 2016.05 for i686 hosts
In-Reply-To: <1476219900-13020-1-git-send-email-romain.naour@gmail.com>
References: <1476219900-13020-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161016131241.43839c5b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Oct 2016 23:04:57 +0200, Romain Naour wrote:
> This Linaro release provide a new toolchain archive for i686 hosts, so update our
> old 2014.09.
> 
> Tested with Qemu qemu-2.4.1-11.fc23 and with HOSTARCH set to x86 in the Buildroot
> main Makefile.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> My host is a x86_64
> ---
>  toolchain/toolchain-external/Config.in             | 29 +---------------------
>  .../toolchain-external/toolchain-external.hash     |  3 +--
>  toolchain/toolchain-external/toolchain-external.mk |  7 ++----
>  3 files changed, 4 insertions(+), 35 deletions(-)

All four patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
