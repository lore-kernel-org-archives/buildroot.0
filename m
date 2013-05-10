From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 17:53:31 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/gcc: the ARC version of gcc
 needs host-flex/host-bison
In-Reply-To: <E6BF041E97966E4DB955F0DF883AD2D6339FF18A@de02wembxa.internal.synopsys.com>
References: <1368114785-14666-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1368114785-14666-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <E6BF041E97966E4DB955F0DF883AD2D6339FF18A@de02wembxa.internal.synopsys.com>
Message-ID: <20130510175331.0e6917aa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Fri, 10 May 2013 14:47:56 +0000, Mischa Jonker wrote:

> Thank you for fixing this. Is there any way I can sort the autobuilder results so that I can see specific build problems for ARC?

Not as of today, you can't filter the results. I'm working on doing
this. I started doing something in Python/Django, but had some issues,
so I guess I'll continue with the PHP stuff we're already using, and
improve it to be able to sort things.

In the mean time, I often monitor the autobuilder results, so if
there's anything ARC related, I'll notify you.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
