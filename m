From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Mar 2013 11:15:17 +0100
Subject: [Buildroot] [PATCH 0 of 3] Fix oprofile build on powerpc
In-Reply-To: <CAAXf6LVnEgPTnc2RcCCPQUuJJxgr3V4eTG9UmjOcSgszY2QNgw@mail.gmail.com>
References: <patchbomb.1363111853@BEANTN0L019720>
 <20130313082821.1ac38352@skate>
 <CAAXf6LVnEgPTnc2RcCCPQUuJJxgr3V4eTG9UmjOcSgszY2QNgw@mail.gmail.com>
Message-ID: <20130315111517.154dfbbe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 13 Mar 2013 09:38:38 +0100, Thomas De Schampheleire wrote:

> I haven't yet looked at your patches in detail, but I did also notice
> the check on perf_event.h in /usr/src/linux. However, this should have
> been fixed with the --with-kernel=$(SYSROOT_DIR).
> However, I just now notice that SYSROOT_DIR does not exist here, and I
> need to find a better solution. I will investigate that aspect
> further.
> 
> Ideally we'd indeed merge your work together with these patches. Do
> you recall what was still missing or not working with your patches?

No, I unfortunately don't remember. But maybe we should get your
patches merged first, they were submitted first, and they look good,
and they solve some of the problems. So just let's get your patches
merged, and we'll fix/improve later on. It doesn't make sense to
"block" your patches just because I did some other related work that I
never submitted.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
