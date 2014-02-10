From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Feb 2014 18:53:39 +0100
Subject: [Buildroot] Bugs cleanup (input requested)
In-Reply-To: <CAAXf6LWN9Cz7b=C5ZDBuNwwpAqLaV1kpN206=1NPN_AWQUEsjw@mail.gmail.com>
References: <CAAXf6LX719WwMSZUGShzANA22z0g+zo5hYNbFYwfHG3ZEGBioQ@mail.gmail.com>
 <20140210154305.0db0bb01@skate>
 <CAAXf6LWzDBwN=U=7U9yK7oQPhq2+c=C6ZHmrK_kiy-3hOAu2BA@mail.gmail.com>
 <20140210174858.62e72709@skate>
 <CAAXf6LWN9Cz7b=C5ZDBuNwwpAqLaV1kpN206=1NPN_AWQUEsjw@mail.gmail.com>
Message-ID: <20140210185339.31f327ee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 10 Feb 2014 18:48:13 +0100, Thomas De Schampheleire wrote:

> > What would this be useful for? I believe we should either find people
> > willing to "adopt" those packages and do the remaining work needed to
> > get them merge, or close the bugs.
> 
> Main goal would be to visually separate 'add-package-foo' enhancements
> (which are relatively easy to close) from other enhancements.

Simply give them a distinctive title, like:

"package addition: <package name>"

> Finding people to adopt the package patches in enhancement requests is
> similar to finding people to adopt patches from the patchwork cleanup
> actions. The amount of developers attending the buildroot developer
> days this year gives me good hopes to actually get to this, but it may
> take some time.

Indeed. I am however for fairly aggressively closing enhancement
requests for package additions that are not very interesting to active
contributors, and unlikely to find an adopter. Things like
open-vm-tools doesn't seem that useful to me, for example :)

Therefore, I would reply in the bug report, ask for either the original
bug reporter or another contributor to adopt the patch, and if no reply
within 2 weeks, close the bug.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
