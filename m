From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 6 Nov 2013 18:28:00 +0100
Subject: [Buildroot] Qt5 puzzle
In-Reply-To: <CALo-6+gmYsfcV1yU2oEAfkbCHCqi2YHSwp6CtvkTX8+bmfXYUw@mail.gmail.com>
References: <CALo-6+gmYsfcV1yU2oEAfkbCHCqi2YHSwp6CtvkTX8+bmfXYUw@mail.gmail.com>
Message-ID: <CAAXf6LUaGLQh8h7Ujnpaciyq4dz3PM43S7spOcpi08Wd83PUtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

On Wed, Nov 6, 2013 at 5:57 PM, Charles Krinke <charles.krinke@gmail.com> wrote:
> Recently one of our app engineers moved to QtQuick 2.0 and all of a sudden
> with the buildroot built binaries from Qt-5.0.2, I am seeing this error when
> a qml-style program is run.
>
> ERROR: Binary compiled with -mfloat-abi=hard but without
> -DUSE_EABI_HARDFLOAT
>
> In searching this, I can see mention of this on the buildroot mailing list
> from June, but no hints or resolution. The archive of the mailing list is
> this page:
>
> http://buildroot-busybox.2317881.n4.nabble.com/ERROR-Binary-compiled-with-mfloat-abi-hard-but-without-DUSE-EABI-HARDFLOAT-td49130.html
>
> Although I am using the TI AM3517 and not Raspberry Pi, the error seems to
> be the same.
>
> I am assuming this has something to do with make options. This morning, I
> tried adding "-DUSE-EABI_HARDFLAT" to the Makefile for libQt5V8 where the
> offending message is coming from, but the cheap shot doesnt work.
>
> I am working with a buildroot from the end of July, so am not using the
> experimental Qt-5.1 stuff (yet) and am hoping not to move forward in a
> crisis if I can help it.
>
> So, ... as usual, I am hoping for a clue or two to let me understand how to
> get QtQuick back to functionality with Qt-5.0.2.

Although I have no experience whatsoever with qt (and will not be able
to help you myself), I suggest to send a (def)config file that
exhibits the problem. This may help others in trying to reproduce the
problem...

Best regards,
Thomas
