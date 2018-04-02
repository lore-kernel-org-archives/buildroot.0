From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 18:33:44 +0200
Subject: [Buildroot] [PATCH 0/3] hostapd: driver selection options
In-Reply-To: <20171230155736.1668-1-alexander.i.mukhin@gmail.com>
References: <20171230155736.1668-1-alexander.i.mukhin@gmail.com>
Message-ID: <20180402183344.14970933@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Dec 2017 18:57:33 +0300, Alexander Mukhin wrote:

> Alexander Mukhin (3):
>   hostapd: select driver support
>   hostapd: make ACS dependent on nl80211
>   hostapd: drop default dependency on netlink

Series applied, thanks. On the last patch, we just did a minor tweak to
use a if BR2_PACKAGE_HOSTAPD_VLAN ... endif block instead of
duplicating the depends on dependency.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
