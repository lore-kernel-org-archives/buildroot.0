From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 May 2013 13:23:37 +0200
Subject: [Buildroot] [PATCH] gst-plugins-bad: fix build of directfb
	plugin
In-Reply-To: <5190BF5B.7050104@mind.be> (Arnout Vandecappelle's message of
 "Mon, 13 May 2013 12:24:27 +0200")
References: <1368398587-21415-1-git-send-email-arnout@mind.be>
 <87y5bjtmer.fsf@dell.be.48ers.dk> <5190BF5B.7050104@mind.be>
Message-ID: <87ppwvt96u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> That's an odd title. Did you mean somtehing like 'Fix directfb plugin
 >> with dfb 1.6.x'?

 Arnout>  It's not actually the plugin that fails to compile, it's the
 Arnout> dfb-example program that is built but not installed. So perhaps a
 Arnout> simpler solution would have been to remove it from Makefile.am and
 Arnout> autoreconfigure.

Ahh, ok - Then it's fine. Committed, thanks.

-- 
Bye, Peter Korsgaard
