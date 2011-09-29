From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Sep 2011 21:38:09 +0200
Subject: [Buildroot] [git commit] gst-plugins-bad: bump version
In-Reply-To: <1317323512.31793.3.camel@bender> (Sven Neumann's message of
 "Thu, 29 Sep 2011 21:11:52 +0200")
References: <20110929190334.639708DAC7@busybox.osuosl.org>
 <1317323512.31793.3.camel@bender>
Message-ID: <871uuzp2am.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Hi Peter,
 Sven> the audioparsers plug-in has moved to gst-plugins-good. You already
 Sven> added the option there, but as far as I can see, you did not remove it
 Sven> in gst-plugins-bad.

Ups, no - I'll fix that now.

 Sven> Actually I also started to work on this update and I think there are
 Sven> some more changes to the options needed to give enough control over what
 Sven> plug-ins are built. Do you have other gstreamer related changes in the
 Sven> queue or should I have a look and send patches?

Not besides that fix, no. Long term I would like to add a makefile macro
to make the --enable-foo / --disable-foo a bit less verbose, but that
can wait.

Thanks.

-- 
Bye, Peter Korsgaard
