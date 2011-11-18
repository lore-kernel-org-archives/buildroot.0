From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Nov 2011 19:27:41 +0000
Subject: [Buildroot] RFC: package patching
In-Reply-To: <20111117224211.0e793a0b@skate>
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <201111172123.05834.arnout@mind.be> <20111117224211.0e793a0b@skate>
Message-ID: <201111181927.41880.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 17 November 2011 21:42:11 Thomas Petazzoni wrote:
> Having a comment inside a patch seems to be enough. Sometimes when the
> patch is pushed upstream, it's merged in the Git repo of the upstream
> project, but there isn't yet a release with the modification, so it
> would be hard to known which "nextversion" the patch will be in.

 Most projects have a single trunk, so you can predict that a patch in trunk will appear in the next release.  Even if a project has a more complex release scheme, it will typically have branches.  The only issue could be that you don't know if it will be 1.9 or 2.0, but then tagging it as 1.9 is a safe bet.

 I find a release number tag much more useful than e.g. a commit ID.  With the commit ID, it is still pretty difficult to find out if a partical release contains it.

 Oh, and patches which have not (yet) been accepted upstream should not be tagged.

 Anyway, as a version bumper, I would use that tag just as a hint.

> We already have comments in patches, those comments can carry the
> upstream status of the patch, which is also compatible with what we
> intend to do with the send-patches.org project.

 Is there going to be a tag for it, similar to Reviewed-by?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
