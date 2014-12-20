From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 16:11:10 +0100
Subject: [Buildroot] [PATCH] package/wpa_supplicant: use correct include
 path for libnl-3.0
In-Reply-To: <1418771247-12079-1-git-send-email-romain.naour@openwide.fr>
References: <1418771247-12079-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141220161110.15d3c773@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 17 Dec 2014 00:07:27 +0100, Romain Naour wrote:
> Fixes:
> ERROR: unsafe header/library path used in cross-compilation: '/usr/include/libnl3'
> 
> Add a dependancy on host-pkgconf when BR2_PACKAGE_LIBNL is enabled.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Reported-by: J?rg Krause <jkrause@posteo.de>
> Cc: J?rg Krause <jkrause@posteo.de>
> ---
>  ...02-use-correct-include-path-for-libnl-3.0.patch | 26 ++++++++++++++++++++++
>  package/wpa_supplicant/wpa_supplicant.mk           |  2 +-
>  2 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 package/wpa_supplicant/0002-use-correct-include-path-for-libnl-3.0.patch

Thanks, applied. Please submit the patch to upstream wpa_supplicant.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
