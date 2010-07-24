From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jul 2010 19:47:45 +0200
Subject: [Buildroot] GetTime() no longer works after toolchain rebuild
In-Reply-To: <AANLkTikKay6hseM5TaLwOuBTci4YqXUn+YhQTrg0o9YT@mail.gmail.com>
References: <29238584.post@talk.nabble.com>
	<AANLkTikKay6hseM5TaLwOuBTci4YqXUn+YhQTrg0o9YT@mail.gmail.com>
Message-ID: <20100724194745.12aa8889@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 24 Jul 2010 23:55:58 +1000
Mitch Davis <mjd+buildroot@afork.com> wrote:

> > I've recently rebuilt a toolchain, and now when I recompile some
> > old (c) code, the GetTime() isn't recognised. ?The code compiles,
> > and runs (mostly) on the target architecture. ?The GetTime()
> > function isn't one I recognise (as I inherited the code), and
> > believe I must have missed something when rebuilding the toolchain.
> > ?Any ideas what library this belongs to, and what I have to do to
> > get it working again.
> 
> I'm not part of the buildroot crew, so don't take my response as 100%
> but as far as I know, GetTime() is not a standard C function or system
> call.  I'm guessing it's part of some user library your old C code is
> linking against.  Can you find a reference to GetTime() using Google?

Yes, GetTime() is not a C library function. So, JNY, could you give
some more details about your problem ? Which application/library you're
trying to compile, the exact error message you're having, etc.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
