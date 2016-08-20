From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 15:01:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-intel:
 use -O2 build optimisation level
In-Reply-To: <1471459209-21757-1-git-send-email-bernd.kuhls@t-online.de>
References: <1471459209-21757-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160820150132.43043b7c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Aug 2016 20:40:09 +0200, Bernd Kuhls wrote:
> Reported by Gustavo:
> http://lists.busybox.net/pipermail/buildroot/2016-August/169959.html
> 
> The fix was suggested on the Gentoo bugtracker:
> https://bugs.gentoo.org/show_bug.cgi?id=582910#c4
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
