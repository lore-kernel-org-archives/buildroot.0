From: Ormund Williams <ormundw@panix.com>
Date: Wed, 02 Dec 2009 18:44:14 -0500
Subject: [Buildroot] Qt fails to build
In-Reply-To: <87ocn3y40l.fsf@macbook.be.48ers.dk>
References: <1257367062.3465.51.camel@station1.ormlab.com>
	<87ocn3y40l.fsf@macbook.be.48ers.dk>
Message-ID: <1259797454.1750.34.camel@station1.ormlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2009-11-15 at 20:36 +0100, Peter Korsgaard wrote:
> >>>>> "Ormund" == Ormund Williams <ormundw@panix.com> writes:
> 
>  Ormund> Hi All,
>  Ormund> I did a git pull this morning and now I get this error, no change to
>  Ormund> the .config file:
> 
>  Ormund> Creating qmake. Please wait...
>  Ormund> make[1]: Entering directory .../buildroot/output/build/qt-embedded-linux-opensource-src-4.5.2/qmake'
>  Ormund> g++: @: No such file or directory
>  Ormund> make[1]: *** [project.o] Error 1
> 
> Hmm, it builds here - Could you post your .config?
> 
Hi Peter,

I tried installing buildroot on a fresh machine but got the same error
so I don't think it's my machine.

I did a new git clone and then git checkout of this commit:
473a91dbe660cd7b0e56b4afc18121da52c89492 now Qt builds.  There are about
a dozen qt specific commits that follow the one above, when I get some
time later this week I'll try to find which change caused the problem.

Regards.
-- 
Ormund Williams
OrmLab LLC
