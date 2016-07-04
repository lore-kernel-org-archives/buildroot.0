From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 11:12:38 +0200
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant: add option to enable
 Wi-Fi Display
In-Reply-To: <20160703232852.8222-1-savoundg@gmail.com>
References: <20160703232852.8222-1-savoundg@gmail.com>
Message-ID: <20160704111238.50bf3b1d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jul 2016 16:28:52 -0700, Georges Savoundararadj wrote:
> BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY depends on
> BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT because CONFIG_WIFI_DISPLAY needs
> CONFIG_P2P.
> 
> Signed-off-by: Georges Savoundararadj <savoundg@gmail.com>
> ---
>  package/wpa_supplicant/Config.in         | 6 ++++++
>  package/wpa_supplicant/wpa_supplicant.mk | 4 ++++
>  2 files changed, 10 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
