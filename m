From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 28 Jan 2009 09:39:48 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/webkit
In-Reply-To: <877i4fx26y.fsf@macbook.be.48ers.dk>
References: <20090127151010.080DA7709E@busybox.osuosl.org>
	<20090128081026.55f4a8f8@hcegtvedt>
	<87fxj3x3ou.fsf@macbook.be.48ers.dk>
	<20090128090655.49da87fd@hcegtvedt>
	<87bptrx2xn.fsf@macbook.be.48ers.dk>
	<20090128091937.6db2ef12@hcegtvedt>
	<877i4fx26y.fsf@macbook.be.48ers.dk>
Message-ID: <20090128093948.68a5b7cd@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 28 Jan 2009 09:30:29 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Hans-Christian" == Hans-Christian Egtvedt
> >>>>> <hans-christian.egtvedt@atmel.com> writes:
> 
>  >> Sure? Ever tried compiling it without WCHAR? ;)
>  >> 
> 
>  Hans-Christian> Qt uses webkit, and AFAIK compiles without WCHAR
> enabled.
> 
> How? Without using libicu? I know close to nothing about webkit.
> 

I dunno, black Qt fuu I guess.

cat qt-embedded-linux-opensource-src-4.4.3/src/3rdparty/webkit/VERSION
This is a snapshot of the Qt port of WebKit from

        git://code.staikos.net/webkit

The commit imported was from the

        origin/qtwebkit-merged-into-qt-4-4 branch/tag

and has the sha1 checksum

        bf04f19228d9968ede068745fd4ec4902c9f9786

>  Hans-Christian> FWIW webkit in Qt 4.5 builds with the AVR32 toolchain
>  Hans-Christian> (gcc 4.2.2 + vendor patch).
> 
> The webkit version we have in BR (some svn nightly) most likely also
> built at some time, but I know from other C++ projects that gcc 4.3.x
> cleaned up quite some stuff and got more strict.
> 

Ah, okay, explains why 4.2.x does not have a problem.

-- 
Best regards,
Hans-Christian Egtvedt
