From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Oct 2011 08:02:19 +0200
Subject: [Buildroot] Some topics for the Buildroot Developer Day
In-Reply-To: <4EA5C53B.5000406@eukrea.com> ("Eric =?utf-8?Q?B=C3=A9nard=22?=
 =?utf-8?Q?'s?= message of "Mon, 24 Oct 2011 22:06:19 +0200")
References: <20111024173815.2277c6dd@skate>
 <20111024165904.GB9199@pengutronix.de> <20111024214747.279c6e72@skate>
 <4EA5C53B.5000406@eukrea.com>
Message-ID: <87vcrdy5g4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric B?nard <eric@eukrea.com> writes:

 Eric> Hi Thomas,
 Eric> Le 24/10/2011 21:47, Thomas Petazzoni a ?crit :
 >> Ok. However note that for the moment, we're only trying to do automated
 >> *build* testing. Automated *runtime* testing is an entirely different
 >> story.
 >> 
 Eric> you may be interested in buildbot or jenkins :
 Eric> http://trac.buildbot.net/
 Eric> http://jenkins-ci.org/

Yes, I'm using buildbot at work for the defconfigs we use, and it works
very well - But the problem is how to get good test coverage of our 700+
package / toolchain / kernel combinations?

What I'm currently doing is simply lots of 'make randpackageconfig'
builds - But it generates lots of data, so I haven't found a good way of
putting this information online.

-- 
Bye, Peter Korsgaard
