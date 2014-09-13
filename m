From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Sep 2014 23:54:24 +0200
Subject: [Buildroot] [PATCH] coreutils: get the uptime program to work
In-Reply-To: <1410381844-14466-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 10 Sep 2014 22:44:04 +0200")
References: <1410381844-14466-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761gr6van.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > coreutils configure script needs to know whether /proc/uptime is
 > available, but this is not possible in a cross-compilation
 > context. This leads to an uptime program that fails to work on the
 > target, as it has been compiled without /proc/uptime reading support.

 > This commit fixes that by telling coreutils at configure time that
 > /proc/uptime will be available on the target (which seems to be a
 > reasonable assumption on Linux systems).

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
