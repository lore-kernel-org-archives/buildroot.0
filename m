From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 17:37:53 +0100
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <49801BBE.8060603@cetrtapot.si> (Hinko Kocevar's message of "Wed\,
	28 Jan 2009 09\:47\:58 +0100")
References: <87skn9iv5w.fsf@macbook.be.48ers.dk>
	<49801BBE.8060603@cetrtapot.si>
Message-ID: <87tz7jtmhq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hinko" == Hinko Kocevar <hinko.kocevar@cetrtapot.si> writes:

Hi,

 Hinko> I've tested my custom Axis etrax LX100 based board (cris
 Hinko> arch-v10 CPU) and buildroot 2009.02-rc2 builds toolchain and
 Hinko> kernel wo problem.  I have minor fixes for 2.6.28.1 kernel and
 Hinko> 4.3.2 gcc regarding cris architecture (please apply):

 Hinko>  - 999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
 Hinko>    remove warnings when compiling gcc-4.3.2
 Hinko>  - linux-2.6.28.1-cris-eth-driver-netpoll.patch
 Hinko>    make cris eth driver compile on 2.6.28.1 kernel
 Hinko>  - linux-2.6.28.1-cris-klist-warnings.patch
 Hinko>    avoid klist warnings at bootup related to alignment of the klist struct (from be 2.6.28 stable)

Thanks, committed as r25105.

 Hinko> Keep up the great work!

Thanks!

-- 
Bye, Peter Korsgaard
