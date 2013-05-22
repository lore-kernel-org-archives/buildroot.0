From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 14:18:14 +0200
Subject: [Buildroot] [PATCH] uClibc: Add upstream patch for context
 functions
In-Reply-To: <1369224304-24734-1-git-send-email-markos.chandras@gmail.com>
References: <1369224304-24734-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <20130522141814.0739c4de@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Wed, 22 May 2013 13:05:04 +0100, Markos Chandras wrote:
> From: Markos Chandras <markos.chandras@imgtec.com>
> 
> These functions are needed by some packages like mongrel2
> and maybe others.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8e132a2b03a7b5ae94199db7db86883c05dca700/build-end.log
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
> Given this patch is quite big, another option would be for these
> packages to depend on !BR2_TOOLCHAIN_BUILDROOT || BR2_UCLIBC_VERSION_SNAPSHOT

I believe this would be more reasonable, until this feature lands into
a stable uClibc version.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
