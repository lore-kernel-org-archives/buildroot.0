From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 01 Oct 2011 14:20:06 +0200
Subject: [Buildroot] [git commit] gst-plugins-base: bump version
In-Reply-To: <1317383828.15482.1.camel@sven> (Sven Neumann's message of "Fri, 
 30 Sep 2011 13:53:58 +0200")
References: <20110929190333.7F3E78DBD5@busybox.osuosl.org>
 <1317383828.15482.1.camel@sven>
Message-ID: <87pqignbt5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> On Thu, 2011-09-29 at 16:42 +0200, Peter Korsgaard wrote:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=def45ab622f942c9639ebe1ede79ac4dd590d8fb
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 >> ---
 >> .../gst-plugins-base/gst-plugins-base.mk           |    2 +-
 >> 1 files changed, 1 insertions(+), 1 deletions(-)
 >> 
 >> diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
 >> index 79ced30..a260f89 100644
 >> --- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
 >> +++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
 >> @@ -3,7 +3,7 @@
 >> # gst-plugins-base
 >> #
 >> #############################################################
 >> -GST_PLUGINS_BASE_VERSION = 0.10.32
 >> +GST_PLUGINS_BASE_VERSION = 0.10.35

 Sven> After this update gst-plugins-base does not any longer compile for me.
 Sven> It bails out when trying to link testchannels:

Yes, I noticed the issue as well afterwards. I discussed it with the
gstreamer devs, and testchannels is just an example program which
doesn't get installed, so I suggest we just remove it (on 0.11 branch it
is moved to examples).

I'll fix it up a little later today.

-- 
Bye, Peter Korsgaard
