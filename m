From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2015 22:31:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-05-08
In-Reply-To: <XnsA49564E40BDF9berndkuhlsPkbjNfxxIA@bernd-kuhls.de> (Bernd
 Kuhls's message of "Sat, 09 May 2015 09:55:04 +0200")
References: <20150509063015.990CD10160E@stock.ovh.net>
 <XnsA49564E40BDF9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <87zj5cjhsu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Thomas Petazzoni
 > <thomas.petazzoni@free-electrons.com> wrote
 > in news:20150509063015.990CD10160E at stock.ovh.net: 

 >> microblazeel |                 xapp_xfs-1.1.4 | NOK |
 >> http://autobuild.buildroot.net/results/688a839ec57e7bc83b490535871b2dac0b
 >> 1309ff/ 

 > Hi,

 > fixed by http://patchwork.ozlabs.org/patch/442068/

I had a closer look at this, and the real issue is actually weak symbol
misdetection in libXfont, so I've marked that patch as rejected and
pushed a fix for libXfont instead.

-- 
Bye, Peter Korsgaard
