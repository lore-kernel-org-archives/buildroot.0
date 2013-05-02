From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 May 2013 18:39:00 +0200
Subject: [Buildroot] Buildroot + CoudeSourcery 2012.09
In-Reply-To: <0ad466f5-7656-47de-8365-dbf01f4cb107@CH1EHSMHS011.ehs.local>
References: <82bbf577-2fa7-4161-aa47-e18b223fc7be@CO9EHSMHS011.ehs.local>
 <20130502115358.7de0cc20@skate>
 <0ad466f5-7656-47de-8365-dbf01f4cb107@CH1EHSMHS011.ehs.local>
Message-ID: <20130502183900.3838caee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear S?ren Brinkmann,

On Thu, 2 May 2013 09:02:18 -0700, S?ren Brinkmann wrote:

> > I guess you're talking about ARM ? We don't have support for CS
> > ARM 2012.09 in Buildroot because it's known to miscompile the Linux
> > kernel.
> Yes it's ARM.
> I can compile the kernel just fine with it. Though, I had to
> cherry-pick a commit to fix breakage with GCC 4.7.2. Commit 'ARM:
> 7668/1: fix memset-related crashes caused by recent GCC (4.7.2)
> optimizations' (sha1: 455bd4c430b0c0a361f38e8658a0d6cb469942b5).

Ah, interesting. I never it myself, but we had a patch a while ago to
introduce this toolchain, and the submitter said it wasn't working
properly:
http://lists.busybox.net/pipermail/buildroot/2012-November/062026.html.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
