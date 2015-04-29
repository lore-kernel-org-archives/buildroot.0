From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Apr 2015 23:29:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/clamav: bump version to 0.98.7,
	enable ipv6 support
In-Reply-To: <1430334334-31393-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Wed, 29 Apr 2015 21:05:34 +0200")
References: <1430334334-31393-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87wq0uwrl9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Clamav uses AC_TRY_RUN in m4/reorganization/code_checks/ipv6.m4 to check
 > for ipv6 support, which is not cross-compile safe. Since buildroot
 > supports ipv6 out-of-the-box now this patch forces ipv6 support.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Ups, I only notice this now. I've reverted Gustavoz version and instead
added this - Thanks.

-- 
Bye, Peter Korsgaard
