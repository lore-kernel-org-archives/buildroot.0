From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 14:58:24 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain-external: bump CodeSourcery
 MIPS to 2016.06-8
In-Reply-To: <1462050625-9973-2-git-send-email-romain.naour@gmail.com>
References: <1462050625-9973-1-git-send-email-romain.naour@gmail.com>
 <1462050625-9973-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20160501145824.4a1e1fb5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 23:10:25 +0200, Romain Naour wrote:
> Add hash for the toolchain sources.
> 
> Runtime tested with Qemu with qemu_mips_malta_defconfig
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  toolchain/toolchain-external/Config.in               | 8 ++++----
>  toolchain/toolchain-external/toolchain-external.hash | 7 +++----
>  toolchain/toolchain-external/toolchain-external.mk   | 2 +-
>  3 files changed, 8 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
