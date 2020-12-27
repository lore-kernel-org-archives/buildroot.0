From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Dec 2020 14:48:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: fix build on mips r6
References: <20201227104442.889130-1-bernd.kuhls@t-online.de>
 <87czyvbd98.fsf@dell.be.48ers.dk>
Message-ID: <gtfmbhxoqt.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 27 Dec 2020 14:16:19 +0100 schrieb Peter Korsgaard:

> How come php uses a bundled copy of pcre2? Can't we make it use our
> external one instead?

Hi Peter,

we already use the external pcre2 package as optional dependency:

https://git.buildroot.net/buildroot/tree/package/php/php.mk#n261

but in lack of it php uses its bundled code:
https://git.buildroot.net/buildroot/tree/package/php/php.mk#n274

Regards, Bernd
