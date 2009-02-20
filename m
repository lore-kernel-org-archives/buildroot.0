From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Feb 2009 09:23:42 +0100
Subject: [Buildroot] Buildroot 2009.02 released
In-Reply-To: <02578E7FA1EB4C8380989D73D0C6C40C@aeglos> (Ulf Samuelsson's
	message of "Thu\, 19 Feb 2009 23\:38\:12 +0100")
References: <87skmkf1s0.fsf@macbook.be.48ers.dk>
	<49941678.4040902@cetrtapot.si> <87ocx7g731.fsf@macbook.be.48ers.dk>
	<60A797DC812E4639BC2F3208D69F6547@aeglos>
	<87ljs28chc.fsf@macbook.be.48ers.dk>
	<02578E7FA1EB4C8380989D73D0C6C40C@aeglos>
Message-ID: <87bpsx8qk1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> Some testing was certainly done, but more is ofcourse always welcome.

 Ulf> I am not aware that anyone but myself has published any test results.

I did for the toolchains, and for everything else I just fixed the
problems when I found any.

 Ulf> There is no recommended way to publish test results.
 Ulf> No recommended format etc.

Sure, like with all other issues - Add an issue to the tracker or mail
the list, both preferably with a patch.

 Ulf> Once it is discovered that there is a problem, there is no clean
 Ulf> way to inform the user that there is a problem with a certain
 Ulf> package so each new user will waste a lot of time trying
 Ulf> to build what is known to be broken.

Well, if you mail the list or add an issue, there is.

 Ulf> Depending on BROKEN is wrong if it builds for other architectures,

Yes, it should be depends on BROKEN if BR2_<arch> ofcourse.

 Ulf> There are several packages that does not build, at least for ARM.
 >> 
 >> Well, let's work on them then. Please start by providing a list -
 >> Either here or as bugtracker issues.
 >> 

 Ulf> My docs/buildall.sh has comments on what is broken for ARM.

And as I commented several times, your setup is not representative for
normal buildroot users as several packages that didn't build with your
script builds just fine in a normal buildroot setup.

 Ulf> I think that running this for different architectures will show if
 Ulf> they build or not.

 Ulf> As for running different applications, I hear that gtk does not run,
 Ulf> but I dont extensively test applications.

I used it ~1 month ago on ARM without problems. If you find problems,
then please report them to the list / tracker.

 Ulf> Maybe we could put some focus on these points.
 >> 
 >> Sure, but please be a bit more specific.

 Ulf> I think it is amateurish  to just go about trying to fix issues.
 Ulf> We need to establish the structure for how we test,
 Ulf> how we publish what we test and how we mark
 Ulf> packages with problem so that users do not waste their time.

Heh, I would certainly prefer to spend our energy on actually fixing
stuff than arguing about how to show what's broken. Everything broken
is a bug, and bugs should get fixed.

Again, please use the bug tracker.

I'm not against doing more structured build tests, and will look into
getting buildbot running again with some sensible defconfigs soonish,
but that shouldn't stop you or anyone else from reporting (and fixing)
bugs.

-- 
Bye, Peter Korsgaard
