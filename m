From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Oct 2009 23:12:38 +0200
Subject: [Buildroot] [PATCH] gst-plugins-good: make new dependency-less
	plugins configurable
In-Reply-To: <200910212304.34971.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Wed\, 21 Oct 2009 23\:04\:33 +0200")
References: <200910200018.17071.markus.heidelberg@web.de>
	<87my3lq960.fsf@macbook.be.48ers.dk> <1256145290.19499.0.camel@sven>
	<200910212304.34971.markus.heidelberg@web.de>
Message-ID: <87d44gpi2h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

Hi,

 >> Ah right, now I rememeber. It is not any longer a valid configure
 >> option for the new release. So I removed it.

 Markus> Yes, directdraw moved from gst-plugins-good to gst-plugins-bad.
 Markus> Would be nice to add this to the commit message then as well as
 Markus> the rename from debug to debugutils to avoid confusion.

I agree, but I already committed and pushed that one - For next time
please.

-- 
Bye, Peter Korsgaard
