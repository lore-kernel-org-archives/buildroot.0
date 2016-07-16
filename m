From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 16:48:00 +0200
Subject: [Buildroot] [PATCH] legacy: properly handle systemd
 compatibility libs
In-Reply-To: <1468011620-28260-1-git-send-email-yann.morin.1998@free.fr>
References: <1468011620-28260-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160716164800.21ba4ffe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Jul 2016 23:00:20 +0200, Yann E. MORIN wrote:
> The legacy symbol for systemd compatibility libraries was not selecting
> the BR2_LEGACY symbol, so the buld-time check would not kick in.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  Config.in.legacy | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
