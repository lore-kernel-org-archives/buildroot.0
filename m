From: Nigel Kukard <nkukard@lbsd.net>
Date: Tue, 06 Jan 2009 14:52:56 +0000
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <87prj1v4dy.fsf@macbook.be.48ers.dk>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
Message-ID: <49637048.9090506@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Hi, and happy new year everyone,
>   
Likewise.

> The end of the year is a moment to take a step back and take a bigger
> look at the situation. I have done that for buildroot, and as I see it
> the two biggest problems we have are:
>
>  - Lack of an active maintainer. No hard feelings, but lets face it -
>    Erik hasn't really been active in buildroot development for quite
>    some time. This isn't a big deal for day to day development, but it
>    means that there's no one doing stuff like keeping the website
>    up to date, a central contact point for infrastruture issues (like
>    the recent break in), make decissions when there is disagreements
>    among developers (we already lost Bernhard because of that), and:
>   
wrt central contacts and points of contacts ... we need that MAINTAINERS
file :)

>  - Lack of releases. It has often been discussed, but nothing has come
>    of it.
>
> I offer to do something about both: Take over maintainership and get
> atual stable releases out the door (if Erik and the other developers
> agree).
>   
Personally I like how you handle the project and try steer it with the
resources available, I would like to see you being the project maintainer.


> What is the plan? Getting the first release out is always the hardest,
> so I would on purpose aim low for the first release and get it out
> soon (February). The target is to get all architectures to build (and
> run where hw is available for test) using the default toolchain config
> and busybox, anything else is just a bonus. I will put out the first
> release candidate early next week, so from then on please don't add
> anything else than bugfixes until the release it out. I believe in
> time based releases, so any architectures that we cannot fix in time
> will simply be disabled in kconfig (E.G. depend on BROKEN).
>
> After that I would like us to move to a regular release schedule every
> 3 months with 2 months of development and 1 month of stabilization.
>   
And those components without maintainers scheduled to be dropped or
deprecated (using BROKEN, DEPRECATED, NEEDS_MAINTAINER or however the
finer detail may advise) after X number of releases if no maintainer
steps up, this would help with some of the more severe bitrot in
portions of buildroot.

> The big issue with buildroot quality control is the mindblowing number
> of configuration combinations and specialized hardware needed to
> test. I am therefore convinced we need to leverage qemu and
> agressively deprecate legacy versions / packages + actively work with
> upstream to keep the number of patches low. I think our users would
> also be happier with a less ambitious project that wouldn't break left
> and right, instead of the current situation.
>
>   
The other thing is possibly a mirror for buildroot releases so people at
least know those packages at those versions will always be available, or
at least available 6 months or so down the line?

-N
