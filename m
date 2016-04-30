From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 18:47:06 +0200
Subject: [Buildroot] [RFC PATCH v2 2/2] toolchain-external: bump
 CodeSourcery aarch64 to 2014.11
In-Reply-To: <1451485816-17554-2-git-send-email-romain.naour@gmail.com>
References: <1451485816-17554-1-git-send-email-romain.naour@gmail.com>
 <1451485816-17554-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20160430184706.676a20ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Dec 2015 15:30:16 +0100, Romain Naour wrote:
> Like for 2014.05, this toolchain need a small fixup to
> import correcly the dynamic loader.
> 
> Runtime tested using qemu_aarch64_virt_defconfig.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> v2: fix typo s/2015.11/2014.11/ (Vicente)
>     remove the custom fixup now that the specific handling
>     is in the toolchain helpers. (ThomasP)
> ---
>  toolchain/toolchain-external/Config.in               | 13 +++++++------
>  toolchain/toolchain-external/toolchain-external.hash |  2 +-
>  toolchain/toolchain-external/toolchain-external.mk   |  4 ++--
>  3 files changed, 10 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
