From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Dec 2013 09:50:43 +0100
Subject: [Buildroot] Availability of old build results
In-Reply-To: <874n6mfjsp.fsf@dell.be.48ers.dk>
References: <20131206002526.58d095e8@skate> <20131205234122.GH3405@free.fr>
 <CAAXf6LVnoGgnwYNS+iqGdqpwdB+XoDC2Z0iCTKz2wxuKZbSYWA@mail.gmail.com>
 <874n6mfjsp.fsf@dell.be.48ers.dk>
Message-ID: <20131206095043.361b3fc4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 06 Dec 2013 09:47:02 +0100, Peter Korsgaard wrote:

>  > 1. During the time -next is opened (until release) we also make test
>  > builds on that branch (but keep the results separate from the master
>  > results, of course).
>  > Pros:
>  >   - better visibility on the quality of -next, before it is being
>  > merged, and a chance to fix the problem beforehand
>  > Cons:
>  >   - attention of developers is diverted away from stabilizing the
>  > upcoming release
>  >   - autobuild computing capacity is diverted away too
> 
> Yeah, I'm not quite sure if this is a good idea.

It would however be the easiest thing to do.

>  > 2. Similar, in a way: when patches are posted to the list (not only
>  > during the stabilization month), run them through some autobuild
>  > configurations 'automatically' to try catching common problems (for
>  > example thread support, mmu support, uclibc problems, ...) and post
>  > the results somewhere. This generates a kind of 'staging moment' for
>  > patches before they get applied, to check their quality.
>  > Whether this should be done for all patches (even at their initial
>  > send) or only makes sense for patches that have been reviewed first
>  > (to make sure the computing power is used usefully) is something that
>  > can be discussed. In the latter case, we'd need to have a trigger to
>  > request the test builds.
> 
> This one I like! Seems like a nice little weekend task to
> implement. I'll try to find time for it (but others are certainly
> welcome to work on it as well)

I'm not sure to understand how this will work. Which patches will be
run through this testing? Who will decide which patches will go? You?
The patch submitter?

On my side, I'm really skeptical about that one: I think we should
rather merge patches faster, so that we simply rely on the existing
autobuilder infrastructure, which works well.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
