From: John Voltz <john.voltz@gmail.com>
Date: Thu, 24 Apr 2008 14:34:02 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package/java: classpath
	concierge jamvm
In-Reply-To: <87fxtb2jxo.fsf@macbook.be.48ers.dk>
References: <20080424164821.800223C7C2@busybox.net>
	<874p9r408c.fsf@macbook.be.48ers.dk>
	<46a136670804241111j3548905fn3ca6f80b56e92dcf@mail.gmail.com>
	<87fxtb2jxo.fsf@macbook.be.48ers.dk>
Message-ID: <46a136670804241134t28b93dddl80fd382224d0afa1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Makefile.autotools.in will use the first argument of call AUTOTARGETS, look
around line 161. I've never used <pkg>_DIR_PREFIX in any of the makefiles
I've created and it works in festival this way, even with the multiple
sub-directories.

John


On Thu, Apr 24, 2008 at 2:21 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "John" == John Voltz <john.voltz@gmail.com> writes:
>
>  John> I don't even see where JAMVM_DIR_PREFIX is being used at
>  John> all. I'm removing it.
>
> It seems to be used in Makfile.autotools.in ($(PKG)_DIR_PREFIX) for
> finding the patches, so you better not.
>
> Does it apply the avr32 patch if you leave it out?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080424/e01130d9/attachment.htm 
