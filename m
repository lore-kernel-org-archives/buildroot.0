From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 11:19:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: fix build error
In-Reply-To: <vi401gxk1k.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Sun, 28 Jul 2019 10:56:31 +0200")
References: <20190706064236.30663-1-bernd.kuhls@t-online.de>
 <20190727223753.2211ac3f@windsurf>
 <XnsAA99E75BA4FE2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <vi401gxk1k.ln2@ID-313208.user.individual.net>
Message-ID: <878ssd1bva.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Am Sat, 27 Jul 2019 22:44:29 +0200 schrieb Bernd Kuhls:
 >> Thomas Petazzoni
 >> <thomas.petazzoni@bootlin.com> wrote in
 >> news:20190727223753.2211ac3f at windsurf:
 >> 
 >>> Could you give a bit more details about how including <stdio.h> can
 >>> solve this build issue ?
 >> 
 >> Hi Thomas,
 >> 
 >> the fix was proposed by the author of tvheadend:
 >> https://tvheadend.org/issues/5667#note-7

 > Hi Thomas,

 > one additional note: A similar patch was already accepted upstream: 
 > https://github.com/tvheadend/tvheadend/commit/
 > 8f1de1621d78c91431238176bf4f6290870a031a

 > When sending this patch I forgot the optional dependency of libdvbcsa 
 > which causes the current build error and needs the same fix.

Will you send a patch for that?

-- 
Bye, Peter Korsgaard
