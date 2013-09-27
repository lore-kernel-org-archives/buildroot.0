From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Fri, 27 Sep 2013 14:56:33 +0000
Subject: [Buildroot] [PATCH] Allow Buildroot to update toolchain
In-Reply-To: <20130927100513.690cdd23@skate>
References: <F9C551623D2CBB4C9488801D14F864C639AD62E9@ex-mb1.corp.adtran.com>
 <87vc1n49b9.fsf@dell.be.48ers.dk>
 <F9C551623D2CBB4C9488801D14F864C639AD653F@ex-mb1.corp.adtran.com>
 <20130927100513.690cdd23@skate>
Message-ID: <F9C551623D2CBB4C9488801D14F864C639AD6A4D@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I still don't understand. What you're explaining is exactly what
> Buildroot is doing today. When you use an external toolchain, Buildroot
> copies the toolchain sysroot (which contains just the C library) in
> output/staging and then progressively "improves" this sysroot by adding
> all the libraries that have been cross-compiled for your target.
> 
> If what you need is then the ability to deliver this toolchain to
> application developers who will not be using Buildroot, but need a
> toolchain with all the libraries, then the proper way to do this is, as
> Peter suggested, to do BR2_HOST_DIR=/opt/some-location/, then do your
> Buildroot build, tarball /opt/some-location/ and deliver that as the
> toolchain to be used by your application developers.

Oh, really?  I totally missed that then.  I remember when that came
out (like last year sometime, right?) but I didn't really look into
it that much.

Well, cool!  I guess I reinvented the wheel on this one, eh?

I guess I'll try your way then and see what happens ;).

If it works exactly as what I'm doing that's cool!

> 
> Or maybe I misunderstanding the use case?

Um, yeah, that's it.  It isn't that I'm goofy or anything ;).

Andy
