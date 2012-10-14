From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Oct 2012 20:13:47 +0200
Subject: [Buildroot] [PATCH] xenomai: bump to 2.6.1
In-Reply-To: <1350059367-4427-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 12 Oct 2012 18:29:27 +0200")
References: <1350059367-4427-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vceczztw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The largefile patch is no longer necessary, it has been merged
 Thomas> upstream. However, in order to make the build work properly with
 Thomas> Thumb2 toolchains (such as Linaro toolchains), an additional fix is
 Thomas> needed. This fix is already upstream and will be part of upcoming
 Thomas> Xenomai releases.

Committed, thanks.

-- 
Bye, Peter Korsgaard
