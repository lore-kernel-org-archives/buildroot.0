From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Dec 2012 15:00:44 +0100
Subject: [Buildroot] [PATCH 2/4] gstreamer: port to gstreamer-1.0
In-Reply-To: <50D1BE2D.8060507@mind.be> (Arnout Vandecappelle's message of
 "Wed, 19 Dec 2012 14:16:29 +0100")
References: <1355916156-17973-1-git-send-email-bogdan@nimblex.org>
 <1355916156-17973-2-git-send-email-bogdan@nimblex.org>
 <8738z25i4i.fsf@dell.be.48ers.dk> <50D1BE2D.8060507@mind.be>
Message-ID: <87d2y63zw3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  OTOH, it's probably not needed to have them side-by-side, so it's
 Arnout> probably sufficient to have a config option in BR2_PACKAGE_GSTREAMER
 Arnout> to differentiate the two.

True - If that doesn't complicate the .mk / Config.in too much.

 Arnout>  I didn't see the original patches, so I can't say if it's easier to
 Arnout> have them side-by-side or within a single package...

It was accidentially sent to the busybox list instead. I've asked Bodgan
to resend the series to the buildroot list.

-- 
Bye, Peter Korsgaard
