From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Jan 2011 23:02:18 +0100
Subject: [Buildroot] [PATCH 5/6] toolchain: do staging symlink
In-Reply-To: <1293795546-19674-8-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Fri, 31 Dec 2010 08:39:05 -0300")
References: <1293795546-19674-1-git-send-email-gustavo@zacarias.com.ar>
	<1293795546-19674-8-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87pqsfc6c5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Make an output/staging -> sysroot symlink just for
 Gustavo> compatibility purposes.  This may be gone in the future so
 Gustavo> don't count on it, use $(STAGING_DIR) instead.

Committed, thanks.

-- 
Bye, Peter Korsgaard
