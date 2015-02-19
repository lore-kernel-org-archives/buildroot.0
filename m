From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:33:55 +0100
Subject: [Buildroot] [PATCH next 1/1] package/x11r7/xserver_xorg-server:
 security bump to version 1.17.1
In-Reply-To: <1424002436-30268-1-git-send-email-bernd.kuhls@t-online.de>
References: <1424002436-30268-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150219223355.521c1269@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 15 Feb 2015 13:13:56 +0100, Bernd Kuhls wrote:
> Fixes:
> 
> CVE-2015-0255 - Information leak in the XkbSetGeometry request of X servers
> http://www.x.org/wiki/Development/Security/Advisory-2015-02-10/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.hash |    6 +++---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   |    2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
