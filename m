From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 20 Jan 2013 13:22:51 +0000
Subject: [Buildroot] [PATCH RFC] Fix avr32 build using internal toolchain
In-Reply-To: <50FBE8EC.6060602@zacarias.com.ar>
References: <1358460970-2081-1-git-send-email-spdawson@gmail.com>
 <20130119113852.6d35aa94@skate>
 <CAHt8ZCOH9FgqzkB2KHJSSBc3k76-07iYNfsQ_rjzQCzOFGLEAg@mail.gmail.com>
 <50FBE8EC.6060602@zacarias.com.ar>
Message-ID: <CAHt8ZCOMQR8NjrsQzcWqRz3hd2EUc+X_0osKOfn-8c=1wY59_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20 January 2013 12:54, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> With gentoo's 4.6.3 it fails for me in the same way as described at
> Atmel's site http://www.atmel.no/buildroot/buildroot-issues.html
> (Error: invalid register list)

Okay. It's working for me on Ubuntu with gcc 4.6.3.

> Do you know if the UC3 microcontrollers are in the same boat?
> If they aren't there may still be some hope for the toolchain (at least
> binutils/gcc, not much for uclibc/linux).

I don't know, I'm afraid. I'm also using uc3b, but haven't had any
contact with Atmel for some time now. Certainly I've heard no warning
shots from Atmel about end-of-life for the uc3 series.

> Testing and fixing is an issue on the toolchain side when there's no
> upgrade path possible.

I don't quite follow your meaning here, I'm afraid.

> I wouldn't like to stick to old and potentially vulnerable versions of
> packages (example: gnutls) because the toolchain is too old to handle
> it, it's problematic.
> And dragging arch-specific patches isn't fun either.

Agreed.

> Maybe we can keep it and start marking broken packages as !BR2_avr32 ?
> That may be a rough ride though with all the dependencies.

I think that's pretty much where we are right now, isn't it?

Simon.
