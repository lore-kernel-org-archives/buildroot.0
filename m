From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 24 Apr 2008 17:18:14 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/package/java: classpath
	concierge jamvm
In-Reply-To: <87r6cv13mx.fsf@macbook.be.48ers.dk>
References: <20080424164821.800223C7C2@busybox.net>
	<874p9r408c.fsf@macbook.be.48ers.dk>
	<46a136670804241111j3548905fn3ca6f80b56e92dcf@mail.gmail.com>
	<87fxtb2jxo.fsf@macbook.be.48ers.dk>
	<46a136670804241134t28b93dddl80fd382224d0afa1@mail.gmail.com>
	<87r6cv13mx.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730804241318p7205b6bdod786341d0b881a4a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The commit that change the makefile was previous to the one updating
the package version, back then, just setting the <pkg>_DIR_PREFIX
wasn't enough to get the patch applied.

I had to do some trial and error to get it to work, and that's the
only way it has *smile*.


On Thu, Apr 24, 2008 at 3:58 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> >>>>> "John" == John Voltz <john.voltz@gmail.com> writes:
>
>   John> Makefile.autotools.in will use the first argument of call
>   John> AUTOTARGETS, look around line 161. I've never used
>   John> <pkg>_DIR_PREFIX in any of the makefiles I've created and it
>   John> works in festival this way, even with the multiple
>   John> sub-directories.
>
>  Ok, so why did you add it to classpath and jamvm?
>
>
>
>  --
>  Bye, Peter Korsgaard
>  _______________________________________________
>  buildroot mailing list
>  buildroot at uclibc.org
>  http://busybox.net/mailman/listinfo/buildroot
>
