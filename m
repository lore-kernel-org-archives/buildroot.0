From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 23:26:48 +0200
Subject: [Buildroot] [PATCH] linux: fix fbtft kernel extension
In-Reply-To: <1420982335-6015-1-git-send-email-ps.report@gmx.net>
References: <1420982335-6015-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150409232648.022193f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sun, 11 Jan 2015 14:18:55 +0100, Peter Seiderer wrote:
> Fixes fbtft kernel extension bug reported by Richard Fergusson ([1]):
> 
> drivers/video/Kconfig:2525: can't open file
> "drivers/video/fbdev/fbtft/Kconfig"
> 
> Fix: write the right fbtft/KConfig path to video/Kconfig or
> video/fbdev/Kconfig (instead of hard coded one)
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-January/117057.html
> 
> Reported-by: Richard Fergusson <fergie4000@gmail.com>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
