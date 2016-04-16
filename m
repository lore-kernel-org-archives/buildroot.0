From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Apr 2016 12:44:26 +0200
Subject: [Buildroot] [PATCH v4 0/4] ARM Cortex-M support and STM32
	defconfigs
In-Reply-To: <1460754140-24255-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 15 Apr 2016 23:02:16 +0200")
References: <1460754140-24255-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878u0dg7ed.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > Yet another version of the ARM Cortex-M support and STM32 defconfigs.

 > Changes since v3:

 >  - Rebased on top of master, dropping all patches that have been
 >    merged. We're down to four patches, yeah!

 >  - Changed the elf2flt package to use the latest upstream version,
 >    which allows to remove the patch that was needed until now to
 >    support ARM noMMU (it has been merged upstream).

 > This new version has been runtime tested on STM32F429 Discovery.

Committed series, thanks!

-- 
Bye, Peter Korsgaard
