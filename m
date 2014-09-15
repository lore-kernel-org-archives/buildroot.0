From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 16:55:57 +0200
Subject: [Buildroot] [PATCH] ARC: gcc - Fix SIZE_TYPE to be "unsigned
 int" instead of long unsigned int"
In-Reply-To: <1410792116.5875.43.camel@abrodkin-8560l.internal.synopsys.com>
References: <1410787585-20387-1-git-send-email-abrodkin@synopsys.com>
 <20140915155052.1b3283ae@free-electrons.com>
 <1410790003.5875.33.camel@abrodkin-8560l.internal.synopsys.com>
 <20140915162914.079b3507@free-electrons.com>
 <1410792116.5875.43.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20140915165557.2536d76d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 15 Sep 2014 14:41:57 +0000, Alexey Brodkin wrote:

> > We have a stupid rule, and stupid rules are meant to be complied
> > with :-)
> 
> Understood - uniformity is good even if the rule itself is not that
> good :)

Absolutely :)

> Funny enough that initially I had the same comment in the patch itself,
> but while looking at output of "git format-patch" I found myself a bit
> frustrated - if I were a reviewer I would say that submitted "full"
> patch looks ridiculous.
> 
> Then I removed comment from commit message. That made me think that you
> guys won't apply a patch that won't show any useful info in git log. 
> 
> So I decided to move a message to the Buildroot commit. This made sense
> for me because at least when I bump version of a package I look at
> history of this package and this way try to figure out what's still
> required and what's not.

Hehe, funny. No problem if there is actually some duplication between
the git commit log, and the patch description itself.

> Moreover looking at the next folder "package/gcc/4.9.1" I found that
> half of patches don't have any comment inside, some have URLs to
> bugs/commits in GCC, some are full-scale patches with verbose
> description.

Half of the patches are carried over since gcc 4.2 or so, in a pre-2008
era, at a point where the state of Buildroot was clearly not as good as
it is today. I think you wouldn't want to look at a pre-2008 Buildroot
tree :-)

That being said, is your comment an indication that you volunteer to do
some research about these patches, write proper descriptions, or even
better help getting them merged upstream? :-)

Joke aside again, it's by having less and less patches with no
description that at some point all patches in Buildroot will have a
description. This way nobody will feel your frustration because it will
just appear to be the "normal thing".

> Now you may understand my frustration.

Yes, of course, I do understand.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
