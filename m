From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 13:52:54 +0100
Subject: [Buildroot] [PATCH] driver_xf86-input-evdev: mtdev is mandatory
 now
In-Reply-To: <1449865884-26291-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449865884-26291-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151212135254.24b34279@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 11 Dec 2015 17:31:24 -0300, Gustavo Zacarias wrote:
> mtdev is no longer optional, so select it and depend upon it, otherwise
> it leads to build failure.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/x11r7/xdriver_xf86-input-evdev/Config.in                   | 1 +
>  package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
