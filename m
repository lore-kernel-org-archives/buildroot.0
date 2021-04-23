From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Apr 2021 23:18:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/openvpn: security bump version
 to 2.5.2
In-Reply-To: <20210422184006.53473-1-bernd.kuhls@t-online.de>
References: <20210422184006.53473-1-bernd.kuhls@t-online.de>
Message-ID: <20210423231803.0cc049f2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 22 Apr 2021 20:40:06 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes CVE-2020-15078:
> https://forums.openvpn.net/viewtopic.php?f=20&t=32179
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/openvpn/openvpn.hash | 2 +-
>  package/openvpn/openvpn.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
