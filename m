From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 Jan 2018 22:53:54 +0100
Subject: [Buildroot] [PATCH v6 3/4] m68k_cf5208: suffers from gcc 64735
In-Reply-To: <1515068911-21112-4-git-send-email-heyleke@gmail.com> (Jan
 Heylen's message of "Thu, 4 Jan 2018 13:28:30 +0100")
References: <1515068911-21112-1-git-send-email-heyleke@gmail.com>
 <1515068911-21112-4-git-send-email-heyleke@gmail.com>
Message-ID: <87a7xonhjh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jan" == Jan Heylen <heyleke@gmail.com> writes:

 > From: Jan Heylen <jan.heylen@nokia.com>
 > so add it to the list of BR2_TOOLCHAIN_HAS_GCC_BUG_64735

 > Identified experimentally by using exception_ptr with m68k_cf5208 and
 > looking at the value of ATOMIC_INT_LOCK_FREE. ATOMIC_INT_LOCK_FREE = 1,
 > so the issue is present. Also verified that gcc 7.x fixed it also for cf5208.

 > Signed-off-by: Jan Heylen <jan.heylen@nokia.com>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
