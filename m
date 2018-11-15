From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Nov 2018 09:40:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-geode:
 add upstream commits to fix build errors
In-Reply-To: <87zhua6fwk.fsf@tkos.co.il> (Baruch Siach's message of "Thu, 15
 Nov 2018 07:58:19 +0200")
References: <20181103142856.11664-1-bernd.kuhls@t-online.de>
 <87k1lftgr9.fsf@dell.be.48ers.dk> <87zhua6fwk.fsf@tkos.co.il>
Message-ID: <877eheu41h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > Peter Korsgaard writes:

 >>>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
 >> 
 >> > Fixes
 >> > http://autobuild.buildroot.net/results/a9b/a9baf6ecf147f336021edda20bb091b8aa071209/
 >> 
 >> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> 
 >> Committed to 2018.02.x and 2018.08.x, thanks.

 > Not in the 2018.02.x branch as of ea1bf543b7753.

Sorry, it is pushed now.

 > Is this fix applicable to 2018.02.x?

I did not verify it, but we are using the same version of the geode
driver in 2018.02.x and 2018.08.x / master.

-- 
Bye, Peter Korsgaard
