From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 22:01:47 +0200
Subject: [Buildroot] [PATCH] qemu: enable for aarch64
In-Reply-To: <1435587214-10000-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1435587214-10000-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20150629220147.1fd49f23@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear gustavo.zacarias at free-electrons.com,

On Mon, 29 Jun 2015 11:13:34 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Enable the target qemu for aarch64 since it works just fine.
> Only tested using userland CPU emulation (no HYP) with a
> qemu_aarch64_virt_defconfig image inside a qemu_aarch64_virt_defconfig
> instance.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/qemu/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
