From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 23:03:29 +0100
Subject: [Buildroot] [PATCH v2] wpa_supplicant: add mesh support (IEEE
 80211s)
In-Reply-To: <1478517444-7093-1-git-send-email-yegorslists@googlemail.com>
References: <1478517444-7093-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20161107230329.30687593@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 Nov 2016 12:17:24 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes v1 -> v2:
> 	- use WPA_SUPPLICANT_CONFIG_ENABLE for CONFIG_IEEE80211W (Baruch Siach)
> 	- remove CONFIG_SAE as it will be automatically selected by CONFIG_MESH
> 	
>  package/wpa_supplicant/Config.in         | 7 +++++++
>  package/wpa_supplicant/wpa_supplicant.mk | 5 +++++
>  2 files changed, 12 insertions(+)

Applied to next, thanks. But I agree with Baruch: this CONFIG_SET vs.
CONFIG_ENABLE stuff is messy. Someone should clean this up a bit.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
