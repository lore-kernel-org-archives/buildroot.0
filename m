From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 31 Jan 2012 10:40:28 +0100
Subject: [Buildroot] [PATCH] Documentation: quotes around TARGET_CC
	variable.
In-Reply-To: <CAGiDA6KijKDv6-H6jgVaRWro6ByeoOkkfG7X51EJZOJhmwsV-Q@mail.gmail.com>
 (Shawn J. Goff's message of "Mon, 30 Jan 2012 11:03:27 -0500")
References: <CAGiDA6KijKDv6-H6jgVaRWro6ByeoOkkfG7X51EJZOJhmwsV-Q@mail.gmail.com>
Message-ID: <87obtkjjlf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Shawn" == Shawn J Goff <shawn7400@gmail.com> writes:

 >> From 9503b4458db0a77b1aeb283739d3f811b7a97fd3 Mon Sep 17 00:00:00 2001
 Shawn> From: "Shawn J. Goff" <shawn7400@gmail.com>
 Shawn> Date: Mon, 30 Jan 2012 10:42:29 -0500
 Shawn> Subject: [PATCH] Documentation: quotes around TARGET_CC command.

 Shawn> When ccache is enabled, TARGET_CC is "ccache gcc". Without quotes,
 Shawn> when assigning CC=$(TARGET_CC), only "ccache" gets assigned to CC.

Committed, thanks.

-- 
Bye, Peter Korsgaard
