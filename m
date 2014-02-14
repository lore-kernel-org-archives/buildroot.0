From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Feb 2014 21:37:38 +0100
Subject: [Buildroot] [PATCH 0 of 2] busybox/uclibc: copy config file
	from configure step
In-Reply-To: <patchbomb.1392291283@argentina> (Thomas De Schampheleire's
 message of "Thu, 13 Feb 2014 12:34:43 +0100")
References: <patchbomb.1392291283@argentina>
Message-ID: <87r475l9bh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > This patch series changes busybox and uclibc to copy the .config file from
 > the configure step, and not earlier (patch or extract step). This fixes the
 > usage of OVERRIDE_SRCDIR with these packages.

 > This was reported for busybox in bug #5030.

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed series, thanks.

-- 
Bye, Peter Korsgaard
