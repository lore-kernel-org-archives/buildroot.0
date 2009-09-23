From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Sep 2009 20:52:05 +0200
Subject: [Buildroot] use of HOST_GLIB
In-Reply-To: <1253714491.1618.68.camel@sven> (Sven Neumann's message of "Wed\,
	23 Sep 2009 16\:01\:31 +0200")
References: <1253706849.1618.60.camel@sven>
	<8763b9rfde.fsf@macbook.be.48ers.dk> <1253714491.1618.68.camel@sven>
Message-ID: <87pr9hv6i2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 >> Ahh, those must have been missed when we fixed the glib-genmarshal
 >> stuff. The proper variable to use is LIBGLIB2_HOST_BINARY.

 Sven> That is a rather strange name. Nothing in LIBGLIB2_HOST_BINARY
 Sven> tells me that this is glib-genmarshal. What's the variable to use
 Sven> for glib-mkenums then ?

Well, it's just following the approach of the other host packages, but
you can use $(HOST_DIR)/usr/bin/glib-genmarshal as well now that we're
compiling it ourselves. I don't see any references in the tree to a
explicitly defined glib-mkenums, should there be?

-- 
Bye, Peter Korsgaard
