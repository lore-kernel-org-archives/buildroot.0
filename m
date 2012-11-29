From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 29 Nov 2012 12:26:19 +0100
Subject: [Buildroot] Buildroot for avr32
In-Reply-To: <memo.20121129102031.4232H@postmaster+dexdyne.com.cix.co.uk>
References: <memo.20121129102031.4232H@postmaster+dexdyne.com.cix.co.uk>
Message-ID: <CAEYzJUFwwAQnBu3opGyLKkpmc98FJL-rfvndtuPns4rATx8A7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29 November 2012 11:20, David Collier <from_buildroot@dexdyne.com> wrote:

> Hi - we have a design based on the AVR32.
>
> Historically Atmel provided a "special-buildroot-for-AVR32". Trouble is
> their only AVR32 that ran Linux is now end-of-life, and I'm not sure they
> have any interest.
>
> The last version of it I can find is based on a buildroot that is 2 years
> out of date.
>
> So the question is - should I be able to use "standard buildroot" with an
> AVR32 - or was Atmel adding some magic of their own that has not been
> back-ported to the main trunk?
>

I'm not sure what Atmel put in their Buildroot fork, but we've been using
mainline buildroot 2010.08 for one of our AVR32 projects. The only thing
needed to make that version build (I think) is to apply this commit:

http://git.buildroot.net/buildroot/commit/?id=96652637ccfd94442224019c54341bf86094366a

But right now I'm actually in the process of switching that project over to
using an ARM device ;-)

Best regards,
Bj?rn Forsman
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121129/d749267f/attachment-0001.html>
