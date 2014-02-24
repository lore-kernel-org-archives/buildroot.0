From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 24 Feb 2014 12:37:11 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-02-23
In-Reply-To: <877g8kn6qf.fsf@dell.be.48ers.dk>
References: <20140224073008.3ECD8100F60@stock.ovh.net>
 <CAAXf6LVNCe6OeGpe8sngvwErdQPgfbFfHg8f2mxmZBPqajL8AQ@mail.gmail.com>
 <877g8kn6qf.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LX0eoYHR7PUb8MvZdJFiQN29Tt8CBf8iFqY8wFa3FFetw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 24, 2014 at 11:30 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > [Peter: a few of these problems have patches in the queue. Could you
>  > apply these?]
>
> Which ones exactly?

The ones mentioned below, indeed...

>
>
>  >> libsecret-0.15 | 1
>  >      avr32 |                 libsecret-0.15 | NOK |
>  > http://autobuild.buildroot.net/results/2d41f97378f06d0f3922e078ec0d02549690d4c1/
>
>  > Patch available: http://patchwork.ozlabs.org/patch/323392/
>
> Was applied yesterday.

Great, thanks, I didn't see that.

>
>
>  >> tvheadend-c7d0335eb10d02b78... | 1
>
>  > Too old kernel headers (SYS_TURBO), patch available:
>  > http://patchwork.ozlabs.org/patch/323403/
>
> Yes, but that relies on the TOOLCHAIN_HEADERS_AT_LEAST_x stuff. Do we
> want that for 2014.02?

It may be very short before the deadline for a patch series like this,
but if you ask me, I would dare to apply it still.

Best regards,
Thomas
