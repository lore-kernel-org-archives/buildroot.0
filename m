From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 20:02:44 +0200
Subject: [Buildroot] [PATCH] pkg-infra: Fix DOWNLOAD_LOCALFILES
In-Reply-To: <53C8C8C9.1000004@andin.de>
References: <1405609578-28052-1-git-send-email-anaumann@ultratronik.de>
 <53C8C8C9.1000004@andin.de>
Message-ID: <20140718200244.6aad2d2c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Naumann,

On Fri, 18 Jul 2014 09:12:09 +0200, Andreas Naumann wrote:
>  From 40ba2efd131a4fd70e44a0f9f96c4637da279df8 Mon Sep 17 00:00:00 2001
> From: Andreas Naumann <anaumann@ultratronik.de>
> Date: Thu, 17 Jul 2014 16:47:02 +0200
> Subject: [PATCH 1/6] pkg-infra: Fix DOWNLOAD_LOCALFILES
> 
> The cp helperscript expects a filename as target, but just the folder 
> name was given.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>   package/pkg-download.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks. But next time, could you use "git send-email" to send
your patch? Your patch was incorrectly line-wrapped, and the formatting
of the commit log a bit weird.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
