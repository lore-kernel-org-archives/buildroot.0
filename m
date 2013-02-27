From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Feb 2013 22:19:56 +0100
Subject: [Buildroot] [git commit] busybox: 1.21.1 fix for
	move_to_unaligned16()
In-Reply-To: <874ngx5vn5.fsf@dell.be.48ers.dk>
References: <20130227145817.F35689ADAC@busybox.osuosl.org>
 <512E5E7E.2000806@mind.be> <874ngx5vn5.fsf@dell.be.48ers.dk>
Message-ID: <512E787C.9090303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/02/13 21:50, Peter Korsgaard wrote:
>>>>>> >>>>>"Arnout" == Arnout Vandecappelle<arnout@mind.be>  writes:
>   Arnout> On 27/02/13 15:57, Peter Korsgaard wrote:
>   >> commit:http://git.buildroot.net/buildroot/commit/?id=d8024d2d87864eb0ba381291e0e2986f7643c8dc
>   >> branch:http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>   >>
>   >> Signed-off-by: Peter Korsgaard<jacmet@sunsite.dk>
>   >> ---
>   >> .../busybox-1.21.0/busybox-1.21.0-platform.patch   |   11 +++++++++++
>   >> 1 files changed, 11 insertions(+), 0 deletions(-)
>   >>
>   >> diff --git a/package/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch b/package/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch
>   >> new file mode 100644
>   >> index 0000000..2401b86
>   >> --- /dev/null
>   >> +++ b/package/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch
>   >> @@ -0,0 +1,11 @@
>
>   Arnout>  Why do we bother to tell our contributors to add a patch description
>   Arnout> and Signed-off-by if our maintainer doesn't even do it?:-)
>
> Mainly because busybox upstream unfortunately doesn't do it even though
> he has been asked.
>
> But ok, I guess I could dig through busybox git and come up with a
> description

  In that case you could even do a format-patch.


> or atleast link to the upstream location.

  That's what I mean:

  - copy your own commit message text into the patch;

  - mention the upstream URL 
http://busybox.net/downloads/fixes-1.21.0/busybox-1.21.0-platform.patch

  - Add your Sob.


  Actually, I don't even really want to claim that this is the way it 
_should_ be done. Rather, it is what I as a reviewer tell our 
contributors, because that's what I understand our policy is.


> Upstream unfortunately also updates these files without renaming them.

  That is... unfortunate.  Otherwise we could apply them directly with 
BUSYBOX_PATCH (after the patch that allows foreign URLs has been applied).


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
