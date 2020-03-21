From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 15:31:32 +0100
Subject: [Buildroot] [PATCH 1/6] board/stm32mp157c-dk2/genimage.cfg:
 drop hardcoded rootfs partition size
In-Reply-To: <20200321133222.1393674-1-b.bilas@grinn-global.com>
References: <20200321133222.1393674-1-b.bilas@grinn-global.com>
Message-ID: <20200321153132.00f432b9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 21 Mar 2020 14:32:17 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Let genimage to match the size of the rootfs image instead.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg | 1 -
>  1 file changed, 1 deletion(-)

Thanks, series applied. There were two minor issues on PATCH 3/6, I'll
reply to this one specifically.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
