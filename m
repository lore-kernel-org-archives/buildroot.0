From: Will Newton <will.newton@gmail.com>
Date: Thu, 7 Jul 2011 12:54:47 +0100
Subject: [Buildroot] [pull request] libnspr, libnss, and orc packages
In-Reply-To: <87ei22s8s5.fsf@macbook.be.48ers.dk>
References: <BANLkTikhBBip+ogOg4hET8UR=SptAiMbYA@mail.gmail.com>
 <87ei22s8s5.fsf@macbook.be.48ers.dk>
Message-ID: <CAFbHwiTZdk5uR0w=hMrwpW_OUpCxeaAoYy_JVvkZAFUzE7DfpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 7, 2011 at 11:08 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:
>
> ?Will> A few patches adding some new packages that I have been sitting on for a while.
> ?Will> The following changes since commit c80224a3a05e41af5a32e1c663fd3853f313382b:
>
> ?Will> ? toolchain/gcc: bump 4.6.x version to 4.6.1 (2011-06-28 15:19:13 +0200)
>
> ?Will> are available in the git repository at:
> ?Will> ? git://github.com/willnewton/buildroot.git for-upstream
>
> ?Will> Paul Burton (1):
> ?Will> ? ? ? orc: New package for the Oil Runtime Compiler
>
> ?Will> Will Newton (2):
> ?Will> ? ? ? libnspr: New package.
> ?Will> ? ? ? libnss: Add new package.
>
> Thanks, care to send the individual patches to the list as well. Sven
> Neumann has also posted an orc patch, what are the differences between
> his and this one?

The patch for orc that I sent has a little more extra cleanup stuff in
it. I'm not the original author so I'll have to check what the precise
difference is.

The libnspr/libnss ones have been on the list in March and April so I
assumed there was no more review comments to come on those. I'll send
them again anyway.
