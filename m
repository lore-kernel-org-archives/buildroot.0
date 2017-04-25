From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 25 Apr 2017 09:31:00 +0200
Subject: [Buildroot] [PATCH v6 31/31] package/kodi: Add support for
	more	archs
References: <20170424213206.26247-1-bernd.kuhls@t-online.de>
 <20170424213206.26247-32-bernd.kuhls@t-online.de>
 <CAFOYHZABJ6nDTRv0xxT=daZM4VacXDSepiCF9p3exCHyQ3j9ag@mail.gmail.com>
Message-ID: <kia3tdx7qg.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 25 Apr 2017 16:00:51 +1200 schrieb Chris Packham:

>> -ifeq ($(BR2_arm),y)
>> +ifeq ($(BR2_aarch64),y)
>> +KODI_CONF_OPTS += -DWITH_ARCH=aarch64 -DWITH_CPU=aarch64
> 
> Would it make more sense to have
> 
>   KODI_CONF_OPTS += -DWITH_ARCH=$(BR2_ARCH) -DWITH_CPU=$(BR2_ARCH)
> 
> and have explicit cases where BR2_arch doesn't meet Kodi's view of the
> world

Hi Chris,

yes, of course. It is part of my to-do list mentioned in the cover letter:
http://lists.busybox.net/pipermail/buildroot/2017-April/190369.html ;)

Regards, Bernd
