From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 16 Jan 2014 14:13:20 +0100
Subject: [Buildroot] [PATCH 1/1] gst-ffmpeg: Use internal libav instead
	of external ffmpeg
In-Reply-To: <1389877529.6623.4.camel@sven> (Sven Neumann's message of "Thu,
 16 Jan 2014 14:05:29 +0100")
References: <BLU0-SMTP442A9DE801569E9B4917C36D9BE0@phx.gbl>
 <87lhyht3mx.fsf@dell.be.48ers.dk> <52D6EACE.8020403@zacarias.com.ar>
 <87ha95t32e.fsf@dell.be.48ers.dk> <1389877529.6623.4.camel@sven>
Message-ID: <87ppnsoyrz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:

Hi,

> I do think moving to the internal libav copy for gst-ffmpeg until we can
 >> completely remove it is OK though. If people really need it, then the
 >> (outdated) bundled library is still better than no gst-ffmpeg.

 > Are you interested in a patch that adds gst1-libav (version 1.2.x) ? We
 > are using this for a while now. Our package uses the internally bundled
 > library though.

Sure!

-- 
Bye, Peter Korsgaard
