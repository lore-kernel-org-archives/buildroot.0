From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 22:02:18 +0100
Subject: [Buildroot] [PATCH v3 2/5] grub2: add option to install tools
In-Reply-To: <20180926223719.12604-3-nunes.erico@gmail.com>
References: <20180926223719.12604-1-nunes.erico@gmail.com>
 <20180926223719.12604-3-nunes.erico@gmail.com>
Message-ID: <20181126220218.35624d11@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Sep 2018 00:37:16 +0200, Erico Nunes wrote:
> Add an option to install grub2 support tools to the target.
> 
> In the context of Buildroot, some useful target tools provided are
> grub2-editenv, grub2-reboot, which provide means to manage the grub2,
> environment, boot order, and others.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  boot/grub2/Config.in           | 8 ++++++++
>  boot/grub2/grub2.mk            | 5 +++++
>  support/scripts/check-bin-arch | 4 ++++
>  3 files changed, 17 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
