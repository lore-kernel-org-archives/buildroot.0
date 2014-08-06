From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 23:04:46 +0200
Subject: [Buildroot] [PATCH] configs/qemu-microblaze: lock down kernel
 headers
In-Reply-To: <1407358353-21689-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407358353-21689-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140806230446.0303e0f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  6 Aug 2014 17:52:33 -0300, Gustavo Zacarias wrote:
> Now that we use an internal toolchain as default care should be taken to
> avoid breaking things.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  configs/qemu_microblazebe_mmu_defconfig | 5 +++++
>  configs/qemu_microblazeel_mmu_defconfig | 5 +++++
>  2 files changed, 10 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
