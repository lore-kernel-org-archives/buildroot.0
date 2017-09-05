From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:55:53 +0200
Subject: [Buildroot] [PATCH v2 1/2] configs/galileo: grub2 needs wchar
 toolchain
In-Reply-To: <20170905000806.13295-2-sielicki@yandex.com>
References: <20170905000806.13295-1-sielicki@yandex.com>
 <20170905000806.13295-2-sielicki@yandex.com>
Message-ID: <20170905215553.10f7177e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Sep 2017 19:08:05 -0500, Nicholas Sielicki wrote:
> The galileo_defconfig has the line "BR_TARGET_GRUB2=y", but this
> currently has no effect because BR_TARGET_GRUB2 cannot be selected
> without BR2_TOOLCHAIN_BUILDROOT_WCHAR=y, which is not set by default.
> 
> Signed-off-by: Nicholas Sielicki <sielicki@yandex.com>
> ---
>  configs/galileo_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
