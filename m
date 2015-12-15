From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:42:35 +0100
Subject: [Buildroot] [PATCH] linux: add support for vmlinuz.bin kernel
 image format
In-Reply-To: <1450164846-10371-1-git-send-email-yegorslists@googlemail.com>
References: <1450164846-10371-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20151215214235.7b8327ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

On Tue, 15 Dec 2015 08:34:06 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Linux for MIPS supports raw binary zboot image (vmlinuz.bin).
> Add it to the "Kernel binary format" list.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  linux/Config.in | 4 ++++
>  linux/linux.mk  | 4 ++++
>  2 files changed, 8 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
