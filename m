From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 01 Aug 2019 19:15:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: fix build error
References: <20190706064236.30663-1-bernd.kuhls@t-online.de>
 <20190727223753.2211ac3f@windsurf>
 <XnsAA99E75BA4FE2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <vi401gxk1k.ln2@ID-313208.user.individual.net>
 <878ssd1bva.fsf@dell.be.48ers.dk>
Message-ID: <majb1gxf0g.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 01 Aug 2019 11:19:37 +0200 schrieb Peter Korsgaard:

>>>>>> "Bernd" == Bernd Kuhls
>>>>>> <bernd.kuhls@t-online.de> writes:
> 
>  > When sending this patch I forgot the optional dependency of libdvbcsa
>  > which causes the current build error and needs the same fix.
> 
> Will you send a patch for that?

Hi Peter,

let me rephrase my sentence:

When sending the first patch[1] fixing tvheadend build errors I forgot 
the fact, that when the buildroot-supported optional dependency of 
libdvbcsa[2] is activated, additional files are compiled in tvheadend, 
one of them needed the patch I sent here.

If we are talking about the same topic I think no further patches should 
be needed atm ;)

Regards, Bernd

[1] http://patchwork.ozlabs.org/patch/1125591/
    This patch was superseded by the bump in
    http://patchwork.ozlabs.org/patch/1126475/
    which included my initial patch after it was committed upstream.

[2] https://git.buildroot.net/buildroot/tree/package/tvheadend/
tvheadend.mk#n66
