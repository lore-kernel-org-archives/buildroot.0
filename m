From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 15:20:02 +0100
Subject: [Buildroot] [PATCH 1/2] wpa_supplicant: add security patches
In-Reply-To: <1447250946-15575-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447250946-15575-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151111152002.0384f7b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 11 Nov 2015 11:09:05 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-5310 - wpa_supplicant unauthorized WNM Sleep Mode GTK control
> CVE-2015-5315 - wpa_supplicant: EAP-pwd missing last fragment length
> validation
> CVE-2015-5316 - EAP-pwd peer error path failure on unexpected Confirm
> message
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...Key-Data-in-WNM-Sleep-Mode-Response-frame.patch | 32 +++++++++++++
>  ...-peer-Fix-last-fragment-length-validation.patch | 54 ++++++++++++++++++++++
>  ...erver-Fix-last-fragment-length-validation.patch | 51 ++++++++++++++++++++
>  ...r-Fix-error-path-for-unexpected-Confirm-m.patch | 34 ++++++++++++++
>  4 files changed, 171 insertions(+)
>  create mode 100644 package/wpa_supplicant/0002-WNM-Ignore-Key-Data-in-WNM-Sleep-Mode-Response-frame.patch
>  create mode 100644 package/wpa_supplicant/0003-EAP-pwd-peer-Fix-last-fragment-length-validation.patch
>  create mode 100644 package/wpa_supplicant/0004-EAP-pwd-server-Fix-last-fragment-length-validation.patch
>  create mode 100644 package/wpa_supplicant/0005-EAP-pwd-peer-Fix-error-path-for-unexpected-Confirm-m.patch

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
