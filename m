From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Jul 2014 21:43:03 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-07-24
In-Reply-To: <20140727045219.GA2480@tarshish> (Baruch Siach's message of "Sun, 
 27 Jul 2014 07:52:19 +0300")
References: <20140725063012.8107D1015AE@stock.ovh.net>
 <CAMo8BfJ96eqY5hHU-Y8=MPAP48DbC6=tYZ90c0r7FgtoVGYjGQ@mail.gmail.com>
 <20140727045219.GA2480@tarshish>
Message-ID: <87k36ya8qg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 > A less intrusive solution might be adding

 > #ifndef CLOCK_BOOTTIME
 > #define CLOCK_BOOTTIME			7
 > #endif

 > in NetworkManagerUtils.c.

Agreed.

 > Adding CLOCK_BOOTTIME to uClibc sounds like a good idea anyway. I wonder 
 > though why we see so few build failures like this one (only two at 
 > http://autobuild.buildroot.net/?reason=network-manager-0.9.10.0 at the 
 > moment).

Probably because of the dependencies (ude + /kernel headers in
particular).

-- 
Bye, Peter Korsgaard
