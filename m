From: Mitch Davis <mjd+buildroot@afork.com>
Date: Sat, 24 Jul 2010 23:55:58 +1000
Subject: [Buildroot] GetTime() no longer works after toolchain rebuild
In-Reply-To: <29238584.post@talk.nabble.com>
References: <29238584.post@talk.nabble.com>
Message-ID: <AANLkTikKay6hseM5TaLwOuBTci4YqXUn+YhQTrg0o9YT@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 23, 2010 at 1:55 AM, JNY <jny0@hotmail.com> wrote:
>
> I've recently rebuilt a toolchain, and now when I recompile some old (c)
> code, the GetTime() isn't recognised. ?The code compiles, and runs (mostly)
> on the target architecture. ?The GetTime() function isn't one I recognise
> (as I inherited the code), and believe I must have missed something when
> rebuilding the toolchain. ?Any ideas what library this belongs to, and what
> I have to do to get it working again.

I'm not part of the buildroot crew, so don't take my response as 100%
but as far as I know, GetTime() is not a standard C function or system
call.  I'm guessing it's part of some user library your old C code is
linking against.  Can you find a reference to GetTime() using Google?

Mitch.
