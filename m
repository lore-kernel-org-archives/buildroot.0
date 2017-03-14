From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 23:42:03 +0100
Subject: [Buildroot] [PATCH] kmscube: bump version to fix build failures
In-Reply-To: <1489422381-6163-1-git-send-email-festevam@gmail.com>
References: <1489422381-6163-1-git-send-email-festevam@gmail.com>
Message-ID: <20170314234203.5e3d0194@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Mar 2017 13:26:21 -0300, Fabio Estevam wrote:
> Bump kmscube version to fix build failures such as this one seen on sparc64:
> http://autobuild.buildroot.net/results/d7e/d7e82c67e0b04b0aea990bfb19dd6e4fd914bebe/build-end.log
> 
> ,and also the one reported by Gary Bisson with Linaro 2017.02 ARM
> gnueabihf toolchain.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  package/kmscube/kmscube.hash | 2 +-
>  package/kmscube/kmscube.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
