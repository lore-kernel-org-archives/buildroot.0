From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 22:35:36 +0100
Subject: [Buildroot] [PATCHv4 1/4] support/scripts/boot-qemu-image.py:
 don't fail if start-qemu.sh is missing
In-Reply-To: <20201124203022.477461-1-romain.naour@gmail.com>
References: <20201124203022.477461-1-romain.naour@gmail.com>
Message-ID: <20201205223536.0c2da831@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Nov 2020 21:30:19 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> When boot-qemu-image.py script was added, we wanted to run
> each qemu defconfig in gitlab, so we expect that all qemu
> defconfig generate the script start-qemu.sh in images
> directory.
> 
> Don't make it a hard requirement even if we prefer to be
> able to do a runtime test for each qemu defconfig.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  support/scripts/boot-qemu-image.py | 4 ++++
>  1 file changed, 4 insertions(+)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
