From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 12:01:49 +0200
Subject: [Buildroot] nano package fail to build; cannot include curses.h
In-Reply-To: <CAF8i9mNJroNYDMzHDOjwpWX6uwNOY=BN3Yj+RwmgfFqnB2OpLA@mail.gmail.com>
References: <CAF8i9mNJroNYDMzHDOjwpWX6uwNOY=BN3Yj+RwmgfFqnB2OpLA@mail.gmail.com>
Message-ID: <20200509120149.0540a23c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 9 May 2020 01:43:56 -0400
William Tambe <tambewilliam@gmail.com> wrote:

> Nano package fail to build with the following error:
> 
> nano.h:89:10: fatal error: curses.h: No such file or directory
> 
> curses.h library can be found in the following path:
> ./target/usr/include/curses.h
> ./target/usr/include/ncurses.h
> ./host/iron-buildroot-linux-gnu/sysroot/usr/include/curses.h
> ./host/iron-buildroot-linux-gnu/sysroot/usr/include/ncurses.h
> ./host/include/ncurses/curses.h
> ./host/include/ncurses/ncurses.h
> 
> Any idea why the nano package fail to build despite the headers being
> available ?

You need to provide more details, and especially which version of
Buildroot you're using, and a defconfig that allows to reproduce the
issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
