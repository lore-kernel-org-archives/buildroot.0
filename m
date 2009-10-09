From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Oct 2009 13:44:06 +0200
Subject: [Buildroot] [PATCH 03/14] RESEND: handle MMU configuration
In-Reply-To: <20091009113902.GM2266@mx.loc> (Bernhard Reutner-Fischer's
	message of "Fri\, 9 Oct 2009 13\:39\:02 +0200")
References: <87skduj4ut.fsf@macbook.be.48ers.dk>
	<b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
	<20091009115343.0fae0659@surf> <87r5tchkvv.fsf@macbook.be.48ers.dk>
	<20091009113902.GM2266@mx.loc>
Message-ID: <87eipchjw9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 Thomas> What's the usage of these two new options ?
 >> 
 >> Yes, I would like to know this as well. I would imagine properly
 >> supporting nommu would take quite some more effort than this (E.G. most
 >> packages should get hidden).

 Bernhard> why would you want to hide most of the package?

Because they use fork or other nommu-nono's?

-- 
Bye, Peter Korsgaard
