From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 20 Jan 2013 21:23:02 +0000
Subject: [Buildroot] [PATCH RFC] Fix avr32 build using internal toolchain
In-Reply-To: <20130120152152.31628abb@skate>
References: <1358460970-2081-1-git-send-email-spdawson@gmail.com>
 <20130119113852.6d35aa94@skate>
 <CAHt8ZCOH9FgqzkB2KHJSSBc3k76-07iYNfsQ_rjzQCzOFGLEAg@mail.gmail.com>
 <20130120152152.31628abb@skate>
Message-ID: <CAHt8ZCNdi97vEfKAV6ALdOa8G9QBdAuyHQFwYvPV-a+74qH16A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20 January 2013 14:21, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Long term it is a problem to have a gcc 4.2.x only toolchain and an old
> uClibc version. Some packages will fail to build because gcc is too
> old, we'll start depending on some uClibc features that the old uClibc
> version does not have, etc.

Okay, understood.

> I know OpenWRT has some AVR32 support patches for more recent gcc
> versions (maybe gcc 4.5 or something, I don't remember). I tried once
> using them, but it wasn't straightforward, and I didn't want to spend
> too much time on AVR32, honestly :)

Thanks for the lead; I'll see if I can get anywhere with the OpenWRT patches.

Simon.
