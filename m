From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 21:43:26 +0100
Subject: [Buildroot] [PATCH] boot/grub2: add rootwait to default config
In-Reply-To: <1457567195-18182-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457567195-18182-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160310214326.5b38111e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  9 Mar 2016 20:46:35 -0300, Gustavo Zacarias wrote:
> It doesn't hurt, and is useful for removable boot media like a pendrive
> that may depend on usb enumeration and isn't available immediately.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  boot/grub2/grub.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

But it would be good to be consistent and also change it in
boot/grub/menu.lst, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
