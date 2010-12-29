From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Dec 2010 09:17:30 +0100
Subject: [Buildroot] [PATCH 00/10] Toolchain rework, take 3
In-Reply-To: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 28 Dec 2010 16:10:25 -0300")
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y679j8md.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> This is the third batch of patches for the internal toolchain rework.
 Gustavo> Peter merged some of the work so this is a rebase with a few
 Gustavo> fixes and additions related to oprofile and removing
 Gustavo> the BR2_CROSS_TOOLCHAIN_TARGET_UTILS option.

Thanks. Committed first 3 (up to binutils). Care to respin the rest of
the series? Maybe patch 9 should get merged with the main binutils patch
as well.

-- 
Bye, Peter Korsgaard
