From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 22:55:23 +0200
Subject: [Buildroot] [PATCH] odroid: enable console display.
In-Reply-To: <20160807181053.9857-1-daggs@gmx.com>
References: <20160807181053.9857-1-daggs@gmx.com>
Message-ID: <20160807225523.0dacc479@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Aug 2016 21:10:53 +0300, Dagg Stompler wrote:
> the below change will redirect the output to screen and not only to
> serial.
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  board/hardkernel/odroidc2/boot.ini | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, after tweaking the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
