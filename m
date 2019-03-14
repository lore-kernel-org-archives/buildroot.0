From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 22:02:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xdm: security bump
 to version 1.1.12
In-Reply-To: <20190314202616.19906-1-bernd.kuhls@t-online.de>
References: <20190314202616.19906-1-bernd.kuhls@t-online.de>
Message-ID: <20190314220220.56f428f2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Mar 2019 21:26:15 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes CVE-2013-2179.
> 
> Release notes:
> https://lists.x.org/archives/xorg-announce/2019-March/002959.html
> 
> Added all license hashes provided by upstream and license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xapp_xdm/xapp_xdm.hash | 9 +++++++--
>  package/x11r7/xapp_xdm/xapp_xdm.mk   | 2 +-
>  2 files changed, 8 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
