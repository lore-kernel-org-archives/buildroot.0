From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 22:24:40 +0200
Subject: [Buildroot] [PATCH v5 33/34] package/kodi-skin-confluence: new
	package
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-34-bernd.kuhls@t-online.de>
 <20170423103249.GO7228@scaer>
Message-ID: <8d9ftdxnoe.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 23 Apr 2017 12:32:49 +0200 schrieb Yann E. MORIN:

> Bernd, All,
> 
> On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
>> Signed-off-by: Bernd Kuhls
>> <bernd.kuhls@t-online.de>
> 
> I did a build that had confuence enabled and set as the default skin,
> but still the skin used was not conjfluence (it was estuary or the
> other, I don't remeber), and confluence did not appear in the list of
> available skins...
> 
> Regards,
> Yann E. MORIN.

Hi Yann,

just tested the skin patches[1] with a qemu build booting a buildroot-
created rootfs using, among others, these options:

BR2_PACKAGE_KODI_SKIN_DEFAULT_CONFLUENCE=y
BR2_PACKAGE_KODI_SKIN_CONFLUENCE=y

Kodi started with Confluence right from the beginning and it was also 
possible to change to skin to estuary or estouchy, I saw these three 
different entries in the list of available skin addons installed.

Could you please post the defconfig you used so I can try to find the 
problem?

Regards, Bernd

PS: I sent this also to your mail account, but the last mails were 
rejected by your ISP, I hope this will reach you.

[1] http://patchwork.ozlabs.org/patch/756782/
    http://patchwork.ozlabs.org/patch/756783/
