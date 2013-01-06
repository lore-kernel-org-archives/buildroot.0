From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 6 Jan 2013 22:13:59 +0100
Subject: [Buildroot] [PATCH 1/3] libcofi: new package
In-Reply-To: <877gnqf2k7.fsf@dell.be.48ers.dk>
References: <cover.1357505417.git.maxime.hadjinlian@gmail.com>
 <ca62bc23d6fea2e485408cce7bfdf1835a4bfb15.1357505417.git.maxime.hadjinlian@gmail.com>
 <877gnqf2k7.fsf@dell.be.48ers.dk>
Message-ID: <CAGduivzsNvuYaaFAa8M=y5WJXS_vA4V46nyC2dM5ak5t2T8H=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 6, 2013 at 10:02 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:
>
>  Maxime> replacement for memcpy and memset functionality
>
>  Maxime> This package was originally found at :
>  Maxime> https://github.com/huceke/buildroot-rbp By gimli
>  Maxime> <ebsi4711@gmail.com>
>
> The package looks ok from a quick look, but how is it supposed to be
> used? I wouldn't like to see patches to a bunch of packages to link
> against this.
As the author of the package says, the library is used using
LD_PRELOAD on the target.
So no patch should be needed for any packages.
>
> It isn't really rpi specific either.
I don't know about that, the author says it's rpi specific.
>
> --
> Bye, Peter Korsgaard
