From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Sep 2013 09:41:22 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-09-19
In-Reply-To: <87hadebvkm.fsf@dell.be.48ers.dk>
References: <20130920063008.7C55952C101@lolut.humanoidz.org>
 <20130921054145.52b70d5e@skate> <87hadebvkm.fsf@dell.be.48ers.dk>
Message-ID: <20130921094122.4c9d4552@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 21 Sep 2013 07:19:37 +0200, Peter Korsgaard wrote:

>  Thomas> Hum, apparently on ARC, building libgcc requires having the C library
>  Thomas> headers. So, due to the change to build gcc in two passes instead of
>  Thomas> three, we're building libgcc in the first pass, before the C library is
>  Thomas> built, causing (I believe) the above failure. Mischa, if you have any
>  Thomas> insights about this, I'm interested :)
> 
>  Thomas> Considering this problem, and the other SSP problems, I'm starting to
>  Thomas> wonder if my patch that changes the toolchain build mechanism to use
>  Thomas> two passes instead of three shouldn't be reverted for now, until I find
>  Thomas> the time to investigate all the problems that it is causing.
> 
> I'm thinking the same. Will you have time to work on it in the next week
> or so? Otherwise I think we should revert for now.

No, I will not have the time in the next week, that's also why I was
suggesting to revert it for now. Let's see the good side of the thing:
I'm now aware of a few problematic cases that I should test before
submitting the next version.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
