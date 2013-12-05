From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Dec 2013 23:30:08 +0100
Subject: [Buildroot] [PATCH 1 of 3] manual: remove references to
 uninstall commands
In-Reply-To: <52A0F94B.1030600@mind.be>
References: <patchbomb.1386240845@argentina>
 <f2f1b59c4cfbf80a1592.1386240846@argentina>
 <52A0F94B.1030600@mind.be>
Message-ID: <20131205233008.06272dd1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 05 Dec 2013 23:08:11 +0100, Arnout Vandecappelle wrote:
> On 05/12/13 11:54, Thomas De Schampheleire wrote:
> > diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
> > --- a/docs/manual/package-make-target.txt
> > +++ b/docs/manual/package-make-target.txt
> > @@ -63,9 +63,7 @@ Additionally, there are some other usefu
> >   | +show-depends+    | Displays the dependencies required to build the
> >   package
> >
> > -| +clean+           | Run the clean command of the package, also
> > -uninstall the package from both the target and the staging directory; _note
> > -that this is not implemented for all packages_
> > +| +clean+           | Run the clean command of the package
> 
>   The note should stay, I think. Clean is still not implemented for all 
> packages. By the way, weren't we going to remove clean as well?

Yes, we should remove them as well. Can be done as part of a separate
series, I believe. Removing the uninstall commands is already a good
step forward.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
