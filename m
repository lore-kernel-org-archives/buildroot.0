From: Will Newton <will.newton@gmail.com>
Date: Mon, 27 Jul 2009 10:44:39 +0100
Subject: [Buildroot] [git commit] linux-advanced: remove unused ancient
	kernel versions
In-Reply-To: <87d47nqiua.fsf@macbook.be.48ers.dk>
References: <20090725191956.C0CB37639E@busybox.osuosl.org>
	<4A6CBC18.1020507@atmel.com> <87d47nqiua.fsf@macbook.be.48ers.dk>
Message-ID: <87a5b0800907270244h2172338aj7255258ef1fca9fd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 26, 2009 at 9:39 PM, Peter Korsgaard<jacmet@uclibc.org> wrote:
>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>
> ?Ulf> Peter Korsgaard skrev:
> ?>> commit: http://git.buildroot.net/buildroot/commit/?id=f91315e1710c256b353cdc1eba9a2374826798bc
> ?>> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> ?>>
> ?>> More than 2 years old, and no in tree users.
> ?>>
>
> ?Ulf> Why do you believe that this is not used?
>
> like I stated above - No in tree users.
>
> ?Ulf> I have customers which are still on the 2.6.22 level.
>
> Good for them. They are presumably using a 2 year old BR snapshot as
> well?

What is the cost of keeping these options?

Userland and build infrastructure often moves much quicker than
kernels and I often have to patch support for older kernels back into
buildroot. It's not a big difficulty but if the cost of keeping the
options is low I don't see what the gain is in removing them.
