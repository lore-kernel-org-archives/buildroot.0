From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Feb 2013 21:50:22 +0100
Subject: [Buildroot] [git commit] busybox: 1.21.1 fix for
	move_to_unaligned16()
In-Reply-To: <512E5E7E.2000806@mind.be> (Arnout Vandecappelle's message of
 "Wed, 27 Feb 2013 20:29:02 +0100")
References: <20130227145817.F35689ADAC@busybox.osuosl.org>
 <512E5E7E.2000806@mind.be>
Message-ID: <874ngx5vn5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 27/02/13 15:57, Peter Korsgaard wrote:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=d8024d2d87864eb0ba381291e0e2986f7643c8dc
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 >> ---
 >> .../busybox-1.21.0/busybox-1.21.0-platform.patch   |   11 +++++++++++
 >> 1 files changed, 11 insertions(+), 0 deletions(-)
 >> 
 >> diff --git a/package/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch b/package/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch
 >> new file mode 100644
 >> index 0000000..2401b86
 >> --- /dev/null
 >> +++ b/package/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch
 >> @@ -0,0 +1,11 @@

 Arnout>  Why do we bother to tell our contributors to add a patch description
 Arnout> and Signed-off-by if our maintainer doesn't even do it? :-)

Mainly because busybox upstream unfortunately doesn't do it even though
he has been asked.

But ok, I guess I could dig through busybox git and come up with a
description or atleast link to the upstream location.

Upstream unfortunately also updates these files without renaming them.

-- 
Bye, Peter Korsgaard
