From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Sep 2011 21:56:23 +0200
Subject: [Buildroot] [git commit] gst-plugins-bad: bump version
In-Reply-To: <20110929214852.73e8f8a9@skate> (Thomas Petazzoni's message of
 "Thu, 29 Sep 2011 21:48:52 +0200")
References: <20110929190334.639708DAC7@busybox.osuosl.org>
 <1317323512.31793.3.camel@bender> <871uuzp2am.fsf@macbook.be.48ers.dk>
 <20110929214852.73e8f8a9@skate>
Message-ID: <87wrcrnmvs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Thu, 29 Sep 2011 21:38:09 +0200,
 Thomas> Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

 Sven> Actually I also started to work on this update and I think there are
 Sven> some more changes to the options needed to give enough control over what
 Sven> plug-ins are built. Do you have other gstreamer related changes in the
 Sven> queue or should I have a look and send patches?
 >> 
 >> Not besides that fix, no. Long term I would like to add a makefile macro
 >> to make the --enable-foo / --disable-foo a bit less verbose, but that
 >> can wait.

 Thomas> Almost one year ago, proposed by Mike Frysinger:
 Thomas> http://lists.busybox.net/pipermail/buildroot/2010-November/038874.html

Indeed. For the options with dependencies it would be good with an
optional 3rd argument which gets added to <PKG>_DEPENDENCIES if enable,
but yes - Something like that.

-- 
Bye, Peter Korsgaard
