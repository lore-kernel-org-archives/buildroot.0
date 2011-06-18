From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 18 Jun 2011 14:47:27 -0400
Subject: [Buildroot] prefer static libraries question
In-Reply-To: <20110422152527.7ec95de5@surf>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1F99AC7E@EXV1.corp.adtran.com>
 <201104121836.55644.vapier@gentoo.org> <20110422152527.7ec95de5@surf>
Message-ID: <201106181447.28438.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, April 22, 2011 09:25:27 Thomas Petazzoni wrote:
> On Tue, 12 Apr 2011 18:36:54 -0400 Mike Frysinger wrote:
> > might be better to rename or add a new option.  then the build logic
> > is clear: if user *prefers* static linking, we'll still build/install
> > shared libs, but we'll generate static programs everywhere.  if the
> > user *only* wants static builds, then we can skip the shared lib
> > stuff entirely.
> 
> Does the "prefers" use case really makes sense ? I have always found
> our BR2_PREFER_STATIC_LIB a bit odd, and I think it should be
> BR2_USE_STATIC_LIB instead, and compile everything statically.
> 
> What do you think ?

i agree on all points
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110618/4c3aff69/attachment.asc>
