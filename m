From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Dec 2012 08:51:54 -0800
Subject: [Buildroot] [PATCH] libevent: Add Gentoo patch for C libraries
	without the sysctl syscall
In-Reply-To: <CAG2jQ8ga3RoFPshV5x7Fad4rVCnp_aiq9My_HpqPqU1w1Ri-Cg@mail.gmail.com>
 (Markos Chandras's message of "Wed, 5 Dec 2012 12:01:20 +0000")
References: <1353495389-20179-1-git-send-email-markos.chandras@gmail.com>
 <CAG2jQ8ga3RoFPshV5x7Fad4rVCnp_aiq9My_HpqPqU1w1Ri-Cg@mail.gmail.com>
Message-ID: <87obi8a1cl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:

Hi,

 >> +++ b/package/libevent/libevent-sysctl.patch
 >> @@ -0,0 +1,46 @@
 >> +Add Gentoo fix for C libraries that lack the sysctl system call
 >> +http://sources2.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/libevent/files/libevent-2.0.16-sysctl.patch?revision=1.1
 >> +This patch has already been commited upstream
 >> +
 >> +Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
 >> +
 >> +From 358c745e5432f7648b6f8b3188f32b5551cbf9d6 Mon Sep 17 00:00:00 2001
 >> +From: Mike Frysinger <vapier@gentoo.org>
 >> +Date: Thu, 8 Dec 2011 11:39:48 -0500
 >> +Subject: [PATCH] check for sysctl before we use it
 >> +
 >> +Not all C libraries under Linux support the sysctl() func.

 Markos> Ping? :-)

What archs (in Buildroot context) are affected by this?

-- 
Bye, Peter Korsgaard
