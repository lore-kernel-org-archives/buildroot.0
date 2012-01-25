From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 25 Jan 2012 22:07:35 +0100
Subject: [Buildroot] [PATCH v2] New package: linux-firmware
In-Reply-To: <201201251031.14621.minimod@morethan.org>
References: <1327505910-15070-1-git-send-email-yegorslists@googlemail.com>
 <201201251031.14621.minimod@morethan.org>
Message-ID: <CAGm1_kvbynTpn=q9PF64n3U_g8X2CnhROQXAaLTK0MHVkhDpYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 25, 2012 at 5:31 PM, Michael S. Zick <minimod@morethan.org> wrote:
> On Wed January 25 2012, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> add infrastructure for closed binary blobs
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>> Changes:
>> v2:
>> ? ? ? change package name from firmware to linux-firmware (Gustavo Zacarias)
>> ? ? ? create more granular options (Gustavo Zacarias)
>>
>> ?package/Config.in ? ? ? ? ? ? ? ? ? ? ? ?| ? ?1 +
>> ?package/linux-firmware/Config.in ? ? ? ? | ? 46 +++++++++++++++++
>> ?package/linux-firmware/linux-firmware.mk | ? 79 ++++++++++++++++++++++++++++++
>> ?3 files changed, 126 insertions(+), 0 deletions(-)
>> ?create mode 100644 package/linux-firmware/Config.in
>> ?create mode 100644 package/linux-firmware/linux-firmware.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index f219e37..10f9f79 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -185,6 +185,7 @@ source "package/input-tools/Config.in"
>> ?source "package/iostat/Config.in"
>> ?source "package/irda-utils/Config.in"
>> ?source "package/kbd/Config.in"
>> +source "package/linux-firmware/Config.in"
>> ?source "package/lm-sensors/Config.in"
>> ?source "package/lsuio/Config.in"
>> ?source "package/lvm2/Config.in"
>> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
>> new file mode 100644
>> index 0000000..8778189
>> --- /dev/null
>> +++ b/package/linux-firmware/Config.in
>> @@ -0,0 +1,46 @@
>> +config BR2_PACKAGE_LINUX_FIRMWARE
>> + ? ? bool "linux-firmware"
>> + ? ? help
>> + ? ? ? This package provides various binary firmware files
>> + ? ? ? (closed binary blobs) for such devices like LAN, WLAN crads etc.
>>
>
> crads? ?crud? ?cruft? ?cards?
> ;-)

Oops! Next time I'll make ":set spell" before sending. Promise :-)

Any other comments before I send new spell checked version?

Yegor
