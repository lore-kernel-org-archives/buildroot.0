From: Joachim Pihl <jpihl@nevion.com>
Date: Tue, 1 Dec 2009 10:07:56 +0100
Subject: [Buildroot] Where did "project name" go?
In-Reply-To: <87zl63gkl3.fsf@macbook.be.48ers.dk>
References: <op.u383h9jpyqa4qb@jap> <87zl63gkl3.fsf@macbook.be.48ers.dk>
Message-ID: <op.u384zil4yqa4qb@jap>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 01 Dec 2009 09:33:12 +0100, Peter Korsgaard <jacmet@uclibc.org>  
wrote:

> Are you refererring to the project_build_<arch>/<project> stuff, that
> could be used to build variants of a given arch/platform? That was
> removed as part of the cleanup work, as it's a fairly specialized setup
> and it added a lot of confusion / complexity to the system.

That is the part I was referring to. It does make building the same system  
for multiple targets easy (from a user perspective), though, and that is  
now lost. I guess I'm just not the average user.

> You can use an external toolchain to atleast not need to rebuild the
> toolchain (typically the slowest thing to build).
>
> Notice that you can use the O=<path> make argument to put the output
> files somewhere else than ouput, which can be handy when you build for
> several boards from the same tree.
>
> See
> http://git.buildroot.net/buildroot/commit/?id=3b2a803d2842e45a28b58afde6835dc40edb4c52
> for more details.
>

Will look into it.

-- 
Joachim Pihl
Senior R&D Engineer
Nevion Europe

Tel: +47 33 48 94 66
Fax: +47 33 48 99 98
Mobile: +47 91 33 98 91
jpihl at nevion.com
www.nevion.com

------------------------------------------------------
The Global Video Transport Leader
------------------------------------------------------
