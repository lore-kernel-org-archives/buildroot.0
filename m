From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 21:38:13 +0100
Subject: [Buildroot] [PATCH RFC 1/1] package/rauc: select fw_printenv
 for uboot based systems
In-Reply-To: <20191205094238.69841-1-titouan.christophe@railnova.eu>
References: <20191205094238.69841-1-titouan.christophe@railnova.eu>
Message-ID: <20191205213813.69a2eb26@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  5 Dec 2019 10:42:38 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> When operating on a uboot based system, rauc interacts with
> the bootloader environment using fw_printenv and fw_setenv [1].
> 
> These commands should therefore be present on the target if
> the system being built uses uboot.
> 
> [1] See:
> https://github.com/rauc/rauc/blob/v1.2/src/bootchooser.c#L21-L22
> https://github.com/rauc/rauc/blob/v1.2/src/bootchooser.c#L644-L645
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
> Note: we should maybe do the same for EFI, Grub and Barebox, but
>       I'm not familiar with these ones.
> ---
>  package/rauc/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
