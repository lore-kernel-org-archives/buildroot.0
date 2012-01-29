From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Jan 2012 22:34:38 +0100
Subject: [Buildroot] [PATCH 13/14] libelementary: Add new package
In-Reply-To: <201201232339.24375.arnout@mind.be> (Arnout Vandecappelle's
 message of "Mon, 23 Jan 2012 23:39:23 +0100")
References: <CAFbHwiR+R=GpvzroJ6tfyYhLV97DKda-pxSyj8OnmLmRQTtDdA@mail.gmail.com>
 <201201232339.24375.arnout@mind.be>
Message-ID: <87ehuii45t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> +config BR2_PACKAGE_LIBELEMENTARY_EXAMPLES
 >> +       bool "libelementary examples"
 >> +       help
 >> +         Build and install the elemenatry examples.

 Arnout>  Are the examples so interesting that they warrant installation
 Arnout> on the target?  I mean, I would expect the typical user to
 Arnout> experiment with EFL on the host, and just compile the final
 Arnout> application for the target.  If building the example requires
 Arnout> two patches (which will have to be ported when upgrading
 Arnout> libelementary), I'm not sure if the benefit is worth the
 Arnout> effort.

I agree.

-- 
Bye, Peter Korsgaard
