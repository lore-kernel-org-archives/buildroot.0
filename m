From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 14:58:19 +0200
Subject: [Buildroot] [PATCH] toolchain-external: bump CodeSourcery
 NiosII to 2015.11-130
In-Reply-To: <1462045292-22024-1-git-send-email-romain.naour@gmail.com>
References: <1462045292-22024-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160501145819.26065bdf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 21:41:32 +0200, Romain Naour wrote:
> From getting-started.pdf:
> - DWARF signed LEB128 encoding fix
> - Fix CVE 2015-7547 getaddrinfo
> - Breakpoint in non-existent file bug fix
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  toolchain/toolchain-external/toolchain-external.hash | 4 ++--
>  toolchain/toolchain-external/toolchain-external.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
