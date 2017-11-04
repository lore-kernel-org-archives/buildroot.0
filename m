From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 4 Nov 2017 22:00:25 +0100
Subject: [Buildroot] [PATCH] autoconf: use host-gettext's autopoint if
 available in autoreconf
In-Reply-To: <CAAP7ucJmmHCD+ceC7_w+zR8-Pdy3UexKMBhoC4bYQTvZwKBm3A@mail.gmail.com>
References: <20170827110920.15579-1-aleksander@aleksander.es>
 <e3d4f8af-e660-ff80-7157-5b897b8e47c4@mind.be>
 <CAAP7ucJmmHCD+ceC7_w+zR8-Pdy3UexKMBhoC4bYQTvZwKBm3A@mail.gmail.com>
Message-ID: <16379dac-2375-5830-68c3-06540e293d75@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-11-17 18:27, Aleksander Morgado wrote:
>> (and remove the GETTEXTIZE support from pkg-autotools). In a later step we can
>> rename <PKG>_GETTEXTIZE to <PKG>_AUTOPOINT.
>>
> How about having both available for now? i.e. letting packages select
> <PKG>_GETTEXTIZE or <PKG>_AUTOPOINT.

 Yeah, that would be an option to avoid having a big bang change: introduce
<PKG>_AUTOPOINT, and then slowly convert packages that currently use _GETTEXTIZE.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
