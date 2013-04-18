From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 18 Apr 2013 20:45:42 +0000
Subject: [Buildroot]
 =?windows-1252?q?=91=5F=5Fctype=5Ftouplow=5Ft=92_and_?=
 =?windows-1252?q?=91=5F=5Fctype=5Fmask=5Ft=92_does_not_name_a_type?=
In-Reply-To: <20130315160702.7a6a9f7c@skate>
References: <CAJEG_NdqCrS=ny=BMgF4n8ui5kavmOxtWyzMvxe-_97e=wRPTg@mail.gmail.com>
 <20130315105421.675ecf61@skate>
 <CAJEG_NfYFc782e3iy+z_gwitxQT60BPJkX-2R0Ho5CAu9pxL6w@mail.gmail.com>
 <20130315160702.7a6a9f7c@skate>
Message-ID: <F9C551623D2CBB4C9488801D14F864C620953DBA@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

What was the resolution to this issue?  I'm experiencing the same thing
right now.  The easy trick to fix this (as I see it) is to throw a 

#include <bits/uClibc_touplow.h>

into the top of <bits/ctype_base.h>, though I'm guessing that is a
rather nasty hack.

Anyone working with this on the uclibc list?  On that list I saw some
chatter about it throughout a while, but didn't find anything about a
real resolution.

If no one else is looking at it I'll give it a shot at fixing it down
deep in the uclibc code (assuming that is the correct place to fix
this).

Andy
