From: Diego Iastrubni <diegoiast@gmail.com>
Date: Wed, 27 Jul 2011 15:53:03 +0300
Subject: [Buildroot] [PATCH 1/3] bump udev and clean up
In-Reply-To: <CALR4fEKxDB+xH1_X+0xY9KWQXAz_g6zbrQHqzOB81J2jpOcnOg@mail.gmail.com>
References: <4E298D06.4050107@visionsystems.de>
 <4E298E70.50200@visionsystems.de>
 <871uxe10hq.fsf@macbook.be.48ers.dk> <4E2E67C8.7090208@visionsystems.de>
 <CALR4fEK2r2pL6X09pVUG970PUHxY+a52dvNdjjfVaoGLRnn3Mw@mail.gmail.com>
 <871uxcuqg0.fsf@macbook.be.48ers.dk>
 <CALR4fEKGFH5tq-25=j3DW-CVD5Uc-QxUeLoec-JLwSxNUhQw-w@mail.gmail.com>
 <87sjpst92p.fsf@macbook.be.48ers.dk>
 <CALR4fEKxDB+xH1_X+0xY9KWQXAz_g6zbrQHqzOB81J2jpOcnOg@mail.gmail.com>
Message-ID: <CALR4fEL2EY3sU74wXUUW=c3z5MOrYNHfMki-VEKgFCn_7yZGvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 27, 2011 at 1:19 PM, Diego Iastrubni <diegoiast@gmail.com> wrote:
> You are probably right, qouting from
> http://www.spinics.net/lists/hotplug/msg04998.html :
>
> It's generally not a good idea to build new low-level tools against
> outdated kernels or run new low-level tools against them. Things can
> easily go wrong. We usually only test the other way around: new
> kernels on old userspace. That should work fine for quite a while.
>
> So, this patch demands:
>
> 1) newer toolchains
> 2) kernel 2.6.33 and above.
>
> (2) is bad, since 2.6.32 is still maintained. For (1), I have a patch
> in the works, I will test and report.

See patch attached. Just put it inside packages/udev and rebuild.
Works for me, and should not break other things, at least I hope.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: udev-fix-udev-linux-2.6.32-ugly.patch
Type: text/x-patch
Size: 2318 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110727/bd76cf0d/attachment.bin>
