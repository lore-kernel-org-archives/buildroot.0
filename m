From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Feb 2013 22:35:48 +0100
Subject: [Buildroot] [PATCH] kernel-headers: remove legacy code
In-Reply-To: <1361901255-28462-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 26 Feb 2013 18:54:15 +0100")
References: <1361901255-28462-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3pu7o7f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The BR2_KERNEL_HEADERS_2_6_35 symbol no longer exists since some time,
 Thomas> so get rid of code that was specific to this kernel version.

Committed, thanks.

-- 
Bye, Peter Korsgaard
