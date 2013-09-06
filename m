From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Sep 2013 14:58:21 +0200
Subject: [Buildroot] Two or three stages gcc build?
In-Reply-To: <9C6FE6D2-322A-41E7-8B82-C623B5C1F754@gmail.com>
References: <20130705233831.12030038@skate>
 <9C6FE6D2-322A-41E7-8B82-C623B5C1F754@gmail.com>
Message-ID: <20130906145821.4ce0ab13@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Khem Raj,

On Thu, 5 Sep 2013 10:31:46 -0700, Khem Raj wrote:

> I am late in reply but here it is.

No problem. Thanks for your reply.


> > In fe9a576e8d27460468dfe5eac90aad49ab26a8d3 (gcc-cross-intermediate,
> > gcc-crosssdk-intermediate: Remove) you completely remove the
> > intermediate recipes, so I assume they are really no longer needed,
> > even by the uClibc build, since I believe OE-core also supports uClibc
> > builds (thanks to your work).
> 
> thats correct. See the code around where limits.h is installed by gcc initial
> uclibc was less of an issue, glibc was more until last year when a lot of cleanup
> was done especially where build time dependency on libgcc_s and libgcc_eh was averted
> in cross gcc and buildroot you can do the same like i have done for OE I can help out

In the mean time, I've experimented a bit and actually implemented it.
The patch hasn't been merged yet in Buildroot, but it has been posted:
http://lists.busybox.net/pipermail/buildroot/2013-September/077344.html.

Don't hesitate to have a look and tell me what you think.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
