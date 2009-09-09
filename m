From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Sep 2009 09:03:39 +0200
Subject: [Buildroot] [RFC] [PATCH 0/5] Buildroot cleanup
In-Reply-To: <4AA77AA40200007000017857@gwia.alliedtelesyn.co.nz> (angus
	salkeld's message of "Wed\, 09 Sep 2009 09\:51\:32 +1200")
References: <4AA775760200006C0000A21D@gwia.alliedtelesyn.co.nz>
	<4AA77AA40200007000017857@gwia.alliedtelesyn.co.nz>
	<4AA77AA40200007000017857@gwia.alliedtelesyn.co.nz>
Message-ID: <87my541tx0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "angus" == angus salkeld <angus.salkeld@alliedtelesis.co.nz> writes:

Hi,

 >> This would make BR less selfcontained / one-stop-shop though.
 >> 
 angus> Well you could treat crosstool-ng as just another package that
 angus> is available to build.  So if you select crosstool-ng, buildroot
 angus> automatically sets up the correct external toolchain options.

Yes, that sounds like a nice idea. I'll take a closer look at
crosstool-ng in the near future to see how easy this would be..

-- 
Bye, Peter Korsgaard
