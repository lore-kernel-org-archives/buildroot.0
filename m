From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 19:00:15 +0200
Subject: [Buildroot] [PATCH v3 1/4] boot/uboot: add stm32 binary format
In-Reply-To: <20201007144945.1697081-1-shlomi.39sd@gmail.com>
References: <20201007144945.1697081-1-shlomi.39sd@gmail.com>
Message-ID: <20201014190015.65d07d9a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  7 Oct 2020 17:49:42 +0300
Shlomi Vaknin <shlomi.39sd@gmail.com> wrote:

> Add `.stm32` binary format that uboot generates for the trusted configuration.
> 
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
> ---
>  boot/uboot/Config.in | 4 ++++
>  boot/uboot/uboot.mk  | 5 +++++
>  2 files changed, 9 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
