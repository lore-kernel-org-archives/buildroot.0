From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 21 Dec 2014 22:08:43 +0100
Subject: [Buildroot] [PATCH] package/wpa_supplicant: use correct include
 path for libnl-3.0
In-Reply-To: <20141220161110.15d3c773@free-electrons.com>
References: <1418771247-12079-1-git-send-email-romain.naour@openwide.fr>
 <20141220161110.15d3c773@free-electrons.com>
Message-ID: <549736DB.1040304@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 20/12/2014 16:11, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
>
> On Wed, 17 Dec 2014 00:07:27 +0100, Romain Naour wrote:
>> Fixes:
>> ERROR: unsafe header/library path used in cross-compilation: '/usr/include/libnl3'
>>
>> Add a dependancy on host-pkgconf when BR2_PACKAGE_LIBNL is enabled.
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> Reported-by: J?rg Krause <jkrause@posteo.de>
>> Cc: J?rg Krause <jkrause@posteo.de>
>> ---
>>  ...02-use-correct-include-path-for-libnl-3.0.patch | 26 ++++++++++++++++++++++
>>  package/wpa_supplicant/wpa_supplicant.mk           |  2 +-
>>  2 files changed, 27 insertions(+), 1 deletion(-)
>>  create mode 100644 package/wpa_supplicant/0002-use-correct-include-path-for-libnl-3.0.patch
> Thanks, applied. Please submit the patch to upstream wpa_supplicant.
>
> Best regards,
>
> Thomas
Patch sent to the wpa_supplicant mailing list, but it's waiting for moderation.

This is the same patch as for hostapd.

Best regards,
Romain Naour
