From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Jan 2009 13:57:41 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231330238.32308.334.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Wed\, 07 Jan 2009 13\:10\:38 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<1231243376.32308.52.camel@elrond.atmel.com>
	<87vdsssiwo.fsf@macbook.be.48ers.dk>
	<200901070409.42558.markus.heidelberg@web.de>
	<1231326832.32308.320.camel@elrond.atmel.com>
	<87prizl5im.fsf@macbook.be.48ers.dk>
	<1231330238.32308.334.camel@elrond.atmel.com>
Message-ID: <87d4ezl1dm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> but I had to disable SAMBA and STRACE and change to uCLibc-0.9.30
 Ulf> since 0.9.29 does not compile for anything I tried.
 >> 
 >> Ok, why would you use 0.9.29 now 0.9.30 is out? Anyway, I'll do a
 >> 0.9.29 test compile in a moment.

Builds ok here on armv4l with gcc 4.24 / 2.6.28 headers (breaks with
4.3.x with the limits.h error). I'm not interested in fixing up 0.9.29
to work with current compilers, but feel free to do so.

 Ulf> I giess a new version of STRACE has probably been introduced
 Ulf> and this broke the socat.XXX.patch.avr32 patches.
 >> 
 >> socat or strace?

 Ulf> sorry - strace.

Ok, HcE will afaik check in the updated avr32 patch once he gets the
connection sorted out.

 Ulf> It is not fixed by a system which has stable distributions
 Ulf> which are removed and replaced with another stable
 Ulf> distribution which breaks support for a number of systems.
 Ulf> Then distributions might be stable, but the system as a whole
 Ulf> is totally unstable, and unacceptable for professional use.

Breaks support? That shouldn't happen if the release candidates gets
enough testing. 100% safety is not realistic, if you want that, just
don't upgrade to the new version.

 >> With main svn you mean this tree? Maybe it would make more sense to
 >> keep the Atmel stuff in your own fork?

 Ulf> That is not my own fork, it is Atmel Norways fork.

Yes, but Ulf == Atmel.no, right?

 >> I disagree. This is exactly what we SHOULDN'T do. We need to keep
 >> close to upstream and only provide the latest stable version (except
 >> for special situations) and work with upstream to fix problems if any.

 Ulf> Which will break architectures continously, so it will not allow
 Ulf> the use of Buildroot as more than a toy to introduce Linux
 Ulf> until people find something that really works.

Why? Seems to work pretty well elsewhere.

 >> Anything else is just too much work with too little improvements
 >> going upstream.

 Ulf> I do not disagree that we need to ensure that patches are fed
 Ulf> upstream, but the current way does not support working as a team
 Ulf> project.  It is a single user system.

This I don't get - What do you mean?

 Ulf> Since we have opposing views, then I think the rest of the 
 Ulf> people interested in maintaining buildroot, needs to 
 Ulf> also show their desires before any drastic actions in either
 Ulf> direction is taken.

Sure, feel free to speak up.

-- 
Bye, Peter Korsgaard
