From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 14 Jun 2013 11:05:50 +0100
Subject: [Buildroot] [PATCH] toolchain/uClibc: remove deprecated version
	0.9.31
In-Reply-To: <51B9CF6C.5070402@zacarias.com.ar>
References: <1371062793-27218-1-git-send-email-gustavo@zacarias.com.ar>
 <87k3lz2hcf.fsf@dell.be.48ers.dk>
 <CAHt8ZCPEM0E87VSETkkb731SjiwoAcwBGY7D-0-UB5ua7fxgYw@mail.gmail.com>
 <51B9CF6C.5070402@zacarias.com.ar>
Message-ID: <CAHt8ZCOi6MvvAmaoGt0cw8AEhqX+R_8J+UMSU5Pfjs5UtbBy7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo. Thanks for the response.

On 13 June 2013 14:55, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> Rationale was the usual deprecation period and later removal.
> 0.9.31 isn't getting any younger, and lacks modern syscalls/functions -
> i personally haven't been testing packages with that version for a while.
> I'm pretty sure many modern packages will fail without some agressive
> patch backporting.
>
> I'm considering (BIG "considering", it's a non-priority for me) working
> on a systemd/udev bump which will require backports for 0.9.32.x/33.x
> and looking out for 0.9.31.x is not on my list.

Okay. I guess from my point of view I would have preferred it if the
0.9.31 version could have been left until it was actually causing a
problem, instead of as a more "prophylactic" measure.

> Really, Atmel has sunk the AP7 (1), i'm sorry about that, but it's the
> way life is for whatever strategic and/or commercial reason.
> If vanilla toolchain components were in working shape we wouldn't be
> talking about this.

Yes, I understand that we can't keep supporting a "legacy"
architecture indefinitely.

> Can't you keep your project running with buildroot 2013.05 or some other
> release?

Yes; clearly, I'm not going to be able to track Buildroot master any longer.

Simon.
