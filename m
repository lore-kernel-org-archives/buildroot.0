From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 10:24:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/openvpn: security bump version
 to 2.4.9
In-Reply-To: <20200419075919.287521-1-bernd.kuhls@t-online.de>
References: <20200419075919.287521-1-bernd.kuhls@t-online.de>
Message-ID: <20200419102405.52a81353@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Apr 2020 09:59:19 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog:
> https://github.com/OpenVPN/openvpn/blob/release/2.4/ChangeLog
> 
> Fixes CVE-2020-11810.
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
