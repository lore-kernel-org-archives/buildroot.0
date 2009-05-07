From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 May 2009 12:15:39 +0200
Subject: [Buildroot] 2009.05-rc1: fix dmraid build
In-Reply-To: <20090507115722.6d0e1b82@bandomeer.europe.flane.local> (Olaf
	Rempel's message of "Thu\, 7 May 2009 11\:57\:22 +0200")
References: <20090506121110.46c105f8@bandomeer.europe.flane.local>
	<871vr1e589.fsf@macbook.be.48ers.dk>
	<20090507115722.6d0e1b82@bandomeer.europe.flane.local>
Message-ID: <87ws8tcj78.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olaf" == Olaf Rempel <razzor@kopf-tisch.de> writes:

Hi,

 Olaf> The dmraid-build system seems to ignore the implicit rules in
 Olaf> make.tmpl when building with -j2:

Yeah, it seems pretty broken for parallel builds..

 Olaf> After applying your parallel-build patch it *works*,
 Olaf> so no further actions are needed.

Ok, great - Thanks.

-- 
Bye, Peter Korsgaard
