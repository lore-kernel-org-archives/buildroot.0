From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jun 2013 16:06:08 +0200
Subject: [Buildroot] [PATCH] lttng: bump the various LTTng components
In-Reply-To: <1371995888-3263-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 23 Jun 2013 15:58:08 +0200")
References: <1371995888-3263-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zjuf61tb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit bumps the various LTTng components to their latest stable
 Thomas> version: 0.7.7 for liburcu, 1.1.1 for babeltrace, 2.1.3 for libust and
 Thomas> 2.1.2 for lttng-modules.

 Thomas> For babeltrace, the patch
 Thomas> lttng-babeltrace-02-fix-build-old-compilers.patch has been removed
 Thomas> because it has been merged upstream as of version 1.1.1. This is also
 Thomas> the reason why the package no longer needs to be autoreconfigured.

Committed, thanks.

-- 
Bye, Peter Korsgaard
