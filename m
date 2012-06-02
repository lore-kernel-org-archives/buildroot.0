From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 02 Jun 2012 16:05:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-06-01
In-Reply-To: <20120602154159.71af36b2@skate> (Thomas Petazzoni's message of
 "Sat, 2 Jun 2012 15:41:59 +0200")
References: <20120602063108.846A352CE66@lolut.humanoidz.org>
 <20120602154159.71af36b2@skate>
Message-ID: <87sjedstb7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Le Sat,  2 Jun 2012 08:31:08 +0200 (CEST),
 Thomas> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

 >> On 2012-06-01, 125 random build tests have been done and
 >> submitted on autobuild.buildroot.net.
 >> 38 builds have been successful
 >> 87 builds have failed

 Thomas> We clearly see that the 'next' branch has been merged into the master
 Thomas> branch :-)

Yeah ;)

 Thomas> In a summary, the most important build problems are listed below. I'm
 Thomas> Cc'ing the relevant package developers.

 Thomas>  * linphone

 Thomas>    unknown reason:
 Thomas>    http://autobuild.buildroot.org/results/6fa45a2e93ec58288f1b2466c0538a296ffd3edf/build-end.log

It looks like a simple mistake in the configure script of the embedded
mediastreamer2 (we have a similar patch for ifplugd). I think I will add
a seperate mediastreamer2 package and fix it there (unless it is already
fixed).


 Thomas>  * connman

 Thomas>    http://autobuild.buildroot.org/results/6193b7a612efb53f603ae44418516123830c9f62/build-end.log

I'll take a look at this as I bumped the version.

 Thomas>  * webrtc

 Thomas>    not supported on all architectures
 Thomas>    http://autobuild.buildroot.org/results/c93f8f41e5aa47f351c9f5b0db14b5cf18b1784c/build-end.log

And this. Patches for the rest of the problems are more than welcome.

-- 
Bye, Peter Korsgaard
