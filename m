From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 31 Aug 2014 00:03:21 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: fix comment about i965 DRI
	driver
In-Reply-To: <1409435789-24181-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 30 Aug 2014 23:56:29 +0200")
References: <1409435789-24181-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <878um5oct2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The help entry for the i965 DRI driver states that it supports alll
 > Intel GPUs. That's not true, as at least the i915 series is not handled
 > by this driver, but by a separate one.

 > Fix the help text accordingly; remove the useless second part of the
 > help text (which does not mean much for Buildroot.)

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
