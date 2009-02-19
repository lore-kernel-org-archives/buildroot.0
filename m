From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 19 Feb 2009 23:38:12 +0100
Subject: [Buildroot] Buildroot 2009.02 released
References: <87skmkf1s0.fsf@macbook.be.48ers.dk><49941678.4040902@cetrtapot.si>
	<87ocx7g731.fsf@macbook.be.48ers.dk><60A797DC812E4639BC2F3208D69F6547@aeglos>
	<87ljs28chc.fsf@macbook.be.48ers.dk>
Message-ID: <02578E7FA1EB4C8380989D73D0C6C40C@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net





>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>
> Hi,
>
> >> Ahh, seems like you should have tested the release candidates better
> >> ;)
> >>
>
> Ulf> As far as I have seen, there has been very little testing activitiy
> Ulf> going on before the release.
>
> Some testing was certainly done, but more is ofcourse always welcome.
>

I am not aware that anyone but myself has published any test results.
There is no recommended way to publish test results.
No recommended format etc.

Once it is discovered that there is a problem, there is no clean
way to inform the user that there is a problem with a certain
package so each new user will waste a lot of time trying
to build what is known to be broken.

Depending on BROKEN is wrong if it builds for other architectures,
and as mentioned before, if a package is broken due to references
to the host files instead of target files they can still build
if the host has the same settings as buildroot.

> Ulf> There are several packages that does not build, at least for ARM.
>
> Well, let's work on them then. Please start by providing a list -
> Either here or as bugtracker issues.
>

My docs/buildall.sh has comments on what is broken for ARM.

I think that running this for different architectures will show if they 
build or not.

As for running different applications, I hear that gtk does not run,
but I dont extensively test applications.



> Ulf> Several packages build but crash when you start the target.
>
> Again, which ones?
>
> Ulf> Zero documentation on what builds and what does not build.
>
> Everything (in the default versions atleast) is supposed to build,
> what doesn't?
>
> Ulf> Zero documentation on what builds but does not run.
>
> Which ones?
>
> Ulf> Maybe we could put some focus on these points.
>
> Sure, but please be a bit more specific.


I think it is amateurish  to just go about trying to fix issues.
We need to establish the structure for how we test,
how we publish what we test and how we mark
packages with problem so that users do not waste their time.


> -- 
> Bye, Peter Korsgaard
>



Best Regards
Ulf Samuelsson 
