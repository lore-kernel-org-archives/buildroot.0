From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:45:10 +0100
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xserver_xorg-server: fix
 musl build
In-Reply-To: <1453648919-16172-2-git-send-email-bernd.kuhls@t-online.de>
References: <1453648919-16172-1-git-send-email-bernd.kuhls@t-online.de>
 <1453648919-16172-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160126214510.39efb01e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 24 Jan 2016 16:21:59 +0100, Bernd Kuhls wrote:
> The autobuilders did not catch the error yet because they failed
> earlier with other packages, but I am continuing the build based
> on the defconfig from:
> http://autobuild.buildroot.net/results/6fb/6fbe96af007803acfe9deacf26399cb19e5f2b47/defconfig
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0002-musl-arm-inb-outb.patch                   | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/x11r7/xserver_xorg-server/0002-musl-arm-inb-outb.patch

Alpine Linux has a similar patch, but it's doing one more thing:
http://git.alpinelinux.org/cgit/aports/tree/main/xorg-server/fix-musl-arm.patch.

Can you check this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
