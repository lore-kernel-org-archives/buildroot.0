From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Nov 2017 23:16:40 +0100
Subject: [Buildroot] [PATCH] gstreamer: needs dynamic libraries
In-Reply-To: <20171105203122.23724-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sun, 5 Nov 2017 21:31:22 +0100")
References: <20171105203122.23724-1-arnout@mind.be>
Message-ID: <878tfkz7zr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > g_cclosure_marshal_VOID__VOID is defined both in libgobject.a and
 > libgstreamer.a. It is probably possible to fix this, but gstreamer0.10
 > has been deprecated for a long time now and is anyway unlikely to be
 > used in static-only situations, so let's just require dynamic linking.

 > Propagate to the reverse dependencies. opencv3 already did depend on
 > dynamic libs.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed after adding an autobuild reference, thanks.

-- 
Bye, Peter Korsgaard
