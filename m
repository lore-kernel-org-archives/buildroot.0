From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 23:10:53 +0100
Subject: [Buildroot] [PATCH] toolchain-external: add support for musl
 toolchain on ARM EABIhf
In-Reply-To: <1444382088-15919-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1444382088-15919-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151220231053.301f501e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Oct 2015 11:14:48 +0200, Thomas Petazzoni wrote:
> Since a few releases, the pre-built musl external toolchain has added
> an ARM EABIhf variant, built for ARMv5T. This commit allows this
> additional external toolchain to be used.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/Config.in             | 10 +++++++---
>  toolchain/toolchain-external/toolchain-external.mk |  4 +++-
>  2 files changed, 10 insertions(+), 4 deletions(-)

I've applied this patch, despite the lack of review, since it was quite
a trivial patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
