From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 23:19:04 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/x11r7/xserver_xorg-server:
 Fix glamor dependency
In-Reply-To: <1438445235-4662-2-git-send-email-bernd.kuhls@t-online.de>
References: <1438445235-4662-1-git-send-email-bernd.kuhls@t-online.de>
 <1438445235-4662-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150829231904.0d58e0b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  1 Aug 2015 18:07:15 +0200, Bernd Kuhls wrote:
> X.org xserver depends on libepoxy for glamor support, which depends on
> EGL support. Mesa3d is not the only possible EGL provider therefore
> change the dependency check.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: rebased

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
