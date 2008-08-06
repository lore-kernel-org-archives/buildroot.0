From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Aug 2008 14:57:08 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: fix missing dependencies in
	unpacked and config rules
In-Reply-To: <1217323007-10041-1-git-send-email-hans-christian.egtvedt@atmel.com>
	(Hans-Christian Egtvedt's message of "Tue\,
	29 Jul 2008 11\:16\:47 +0200")
References: <1217323007-10041-1-git-send-email-hans-christian.egtvedt@atmel.com>
Message-ID: <87zlnq1eu3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

 Hans-Christian> This patch adds depedency to host-sed and
 Hans-Christian> $(PROJECT_BUILD_DIR) when running make busybox-config
 Hans-Christian> and busybox-unpacked.

Thanks, committed as r23065.

-- 
Bye, Peter Korsgaard
