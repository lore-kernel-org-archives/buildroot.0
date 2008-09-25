From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Sep 2008 12:55:22 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: fix missing dependencies
	inunpacked and config rules
In-Reply-To: <7F3102E19F8147C3A4922F613D734799@aeglos> (Ulf Samuelsson's
	message of "Thu\, 25 Sep 2008 12\:24\:31 +0200")
References: <1217323007-10041-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<87zlnq1eu3.fsf@macbook.be.48ers.dk>
	<7F3102E19F8147C3A4922F613D734799@aeglos>
Message-ID: <87skroze91.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

CC'ed list - Please keep buildroot stuff on the buildroot list.

 Ulf> You are aware that you broke the script downloading the linux image to
 Ulf> the target
 Ulf> by removing $(DATE) from the image name in Config.in?

I take it that you are referring to r23254? If so, why don't you just
set ROOTFS_SUFFIX to what you need?

 Ulf> A fix may be needed, but this should keep $(DATE) in the image name
 Ulf> if the Atmel specific U-boot is used.

-- 
Bye, Peter Korsgaard
