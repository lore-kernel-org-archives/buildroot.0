From: Manas Mangaonkar <manasmangaonkar@gmail.com>
Date: Thu, 28 Mar 2019 22:15:13 +0530
Subject: [Buildroot] [External] Re: Gsoc Interest : Follow upstream
 updates and CVEs of packages
In-Reply-To: <ac97c9c0-ad13-2171-afa9-5671fe6185b2@mind.be>
References: <CALKvhuOFNyav9hJ73YgEFMx8mig3j36GHAdXOnJvFykcaCUVGQ@mail.gmail.com>
 <CANQCQpa-bccz8tigO4K=oJ1jzBcOANOicS1n5XxpFKq0vAVdYA@mail.gmail.com>
 <CALKvhuP5XrG_b2pRDb5fHo=EVoXhm6q_ajq2ZUA4AWzwSG9PEg@mail.gmail.com>
 <CANQCQpZKU8viN3xRurpy9V+1vJ_T8QkT2kUaD1_uzPREOd9mbw@mail.gmail.com>
 <CANQCQpZ=D4zHeZu4_MM8iRmrMr5t941iEixvJwohVN4Kax3Thw@mail.gmail.com>
 <CALKvhuNt9awxn-ks40nMfu2tDmyCWSpWd+O0-V44BxLjp-B1mw@mail.gmail.com>
 <ac97c9c0-ad13-2171-afa9-5671fe6185b2@mind.be>
Message-ID: <CALKvhuO9_8B3vr9bxh7ZeLcaJNXe-8=e1wnFw8-akM+DDugW4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I think it is too late to start preparing a proposal for gsoc now.I am
kinda backing out form this idea.
Sorry
I saw someone else was interested in working on this.
Again sorry for taking your time
- Manas

On Wed, Mar 27, 2019 at 3:25 AM Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi Manas,
>
> On 13/03/2019 14:19, Manas Mangaonkar wrote:
> >> With respect to what breakages?  Test builds or versions not listed in
> >> NVD?
> >
> > For example if a packager,user tries to package something or build
> something for
> > buildroot.but then due to some upstream dependency issues
> > or other problems it does not build.Then this can be automatically
> reported as a
> > issue in the upstream repo.This is a git specific approach though.
> > but this could work for everything
>
>  The project we had in mind was more about identifying open CVEs (or other
> vulnerabilities) on Buildroot packages, not on problems with building
> them. For
> the latter, we already have the autobuild infrastructure that serves very
> well.
>
>
> >> I don't think a NVD only approach makes sense.  It could be a
> >> start but there are tools that centralize feeds.  I'd suggest
> >> reviewing Debian, Gentoo, and other distros approaches and tooling for
> >> this situation.
> >
> > As a packager at fedora,currently we have automated update posting on
> bugzilling
> > whenver we have updates available
>
>  We have that too (since recently) [1]. Well, not creating bugs
> automatically,
> and the bulk of the packages don't have a match at release-monitoring yet,
> but
> it's a start :-)
>
> > but not automated build breakage notifier due
> > to upstream.
>
>  We don't have anything like automatic updates, and I'm not sure if we
> would
> want it....
>
> > as far as i know same goes for Debian.There does exist one tool that
> releases to
> > Github then to pypi and then to fedora(which is fedora's own gsoc
> project).
> > So modifying it with buildroot functionality and other custom functions
> for
> > buildroot and tracking cve would be something to consider.
> >
> > Owasp tracking project looks interesting.
>
>  The eye candy scares the hell out of me :-)
>
>  But it's true, if we can convert [1] into a BoM for Dependency-Track then
> that
> tool can take care of identifying vulnerabilities.
>
>
>  Regards,
>  Arnout
>
>
> [1] http://autobuild.buildroot.net/stats/
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190328/e6f1fa05/attachment.html>
