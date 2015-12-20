From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Dec 2015 18:58:46 +0100
Subject: [Buildroot] [PATCH v3] package/vsxu: new package
References: <1450547215-8524-1-git-send-email-bernd.kuhls@t-online.de>
 <5675E81E.8010606@mind.be>
Message-ID: <mr6jkcxh6u.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Am Sun, 20 Dec 2015 00:28:30 +0100 schrieb Arnout Vandecappelle:

>  This should definitly be inside a if(UNIX). Obviously for buildroot
>  that doesn't matter but for upstream it probably does.

I will let upstream decide about the patches, until then we have a 
working buildroot package for vsxu ;)

>> +VSXU_LICENSE = GPLv3
> 
>  Only artiste_main.c is really GPLv3+, all the rest is GPLv2+ or
>  LGPLv2.1+.
> Also, the whole of cal3d is LGPLv2.1+. So I'd give it GPLv3+, LGPLv2.1+.
> 
>> +VSXU_LICENSE_FILES = COPYING
> 
>  and add COPYING.LESSER here.

Done.

>  I guess there should be an optional dependency on jack and pulseaudio
>  as well
> (plugins/src/sound.rtaudio).

Done, sent v4: http://patchwork.ozlabs.org/patch/559352/

Regards, Bernd
