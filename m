From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 19 Jan 2013 22:49:51 +0100
Subject: [Buildroot] Gstreamer 0.10 vs. Gstreamer 1.0,
	gst-ffmpeg vs. gst-libav, ffmpeg vs. libav confusion
In-Reply-To: <50FAF2EF.2050707@mind.be> (Arnout Vandecappelle's message of
 "Sat, 19 Jan 2013 20:24:31 +0100")
References: <50FA0C40.30907@petroprogram.com> <50FAF2EF.2050707@mind.be>
Message-ID: <878v7og7wg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  Yes, for GStreamer 1.0 there should be separate packages. For one
 Arnout> thing, the new plugin libraries don't have the same set of plugins.

 Arnout>  They should be called something like BR2_PACKAGE_GSTREAMER_10 (no
 Arnout> dots allowed in config symbols). Which is of course mightily
 Arnout> confusing, since the old thing is called gstreamer-0.10...

 Arnout>  Note that Bogdan Radulescu posted a patch series to bump the
 Arnout> GStreamer packages to 1.0. I thought he was going to resubmit with new
 Arnout> packages instead of bumps, but that hasn't appeared on the list yet.

Me too..

 >> And is it worth adding libav as an separate package to buildroot at all
 >> or just use the internal version provided by gst-libav plugin
 >> when compiling ?

 Arnout> If it's just gst-libav, I don't think it's worth introducing libav as
 Arnout> a package. But if some other package starts to use libav instead of
 Arnout> ffmpeg, it will be necessary.

Agreed.

-- 
Bye, Peter Korsgaard
