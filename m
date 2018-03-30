From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 21:30:21 +0200
Subject: [Buildroot] [PATCH] ntp: security bump to version 4.2.8p11
In-Reply-To: <6be4748599ab638473e99b71ed5343181787ede0.1520355647.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 6 Mar 2018 19:00:47 +0200")
References: <6be4748599ab638473e99b71ed5343181787ede0.1520355647.git.baruch@tkos.co.il>
Message-ID: <87woxt2wfm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixed or improved security issues:
 >   CVE-2016-1549 (fixed in 4.2.8p7; this release adds protection): A
 >   malicious authenticated peer can create arbitrarily-many ephemeral
 >   associations in order to win the clock selection algorithm

 >   CVE-2018-7182: Buffer read overrun leads to undefined behavior and
 >   information leak

 >   CVE-2018-7170: Multiple authenticated ephemeral associations

 >   CVE-2018-7184: Interleaved symmetric mode cannot recover from bad
 >   state

 >   CVE-2018-7185: Unauthenticated packet can reset authenticated
 >   interleaved association

 >   CVE-2018-7183: ntpq:decodearr() can write beyond its buffer limit

 > Drop patch #3. libntpq_a_CFLAGS now includes NTP_HARD_CFLAGS via
 > AM_CFLAGS.

 > Add license file hash.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
