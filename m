From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 12 Jun 2008 17:55:29 +0200
Subject: [Buildroot] Still no answer for a contribution made in March
References: <20080611161156.33737116@crazy><46a136670806110808x737929a4red33f32c593ae6e2@mail.gmail.com><20080611154121.GI3795@mx.loc>
	<20080612095933.25f3345e@crazy><871w33doy1.fsf@macbook.be.48ers.dk><0c2401c8cc99$baad47c0$0c0514ac@atmel.com>
	<87hcby8xmw.fsf@macbook.be.48ers.dk>
Message-ID: <0cd501c8cca5$1be1eb80$0c0514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> >> Hi,
> >> 
> >> >> Yea, and that's the reason why the svn-repo is completely fux0red up.
> >> 
> Thomas> I don't necessarly think so. Here, the issue is not a bottleneck at the
> Thomas> commit level, but rather a patch review bandwidth problem.
> >> 
> >> Agree - And lack of testing before stuff gets checked in. The deeper
> >> issue is that we don't do releases I guess, so there's a tension
> >> between doing development, and having something stable for actual use.
> >> 
> 
> Ulf> Maybe we should start?
> 
> Fine by me, but that means we'll need to spend time stabilizing the
> tree and make sure the packages actually work (on multiple archs). Do
> you have time to help on this?
> 

In August I think there will be time for implementation, 
but we could discuss the underlying architecture before that.

The tarball mirror server is critical.
I have been trying to convince my colleagues to set something up,
and there is some progress, since some packages are now at
http://www.atmel.no/buildroot/source/mirror/
and this could be used for testing the mirror function.

Anyone volunteering for implementing a wget script?

> That's why I want to get buildbot up and running.
> 
> Ulf> Other project are using "git" and is sneering at "svn".
> Ulf> Should we change?
> 
> We could, but there's no infrastructure for git on uclibc.org, and the
> other uclibc.org projects use svn. I don't think it matters much, as
> you can just use git-svn (like I do).
> 
> -- 
> Bye, Peter Korsgaard
>


Best Regards
Ulf Samuelsson
