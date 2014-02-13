From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Feb 2014 23:01:16 +0100
Subject: [Buildroot] [PATCH] glibc: add 2.19 as a supported version
In-Reply-To: <1392054226-20285-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 10 Feb 2014 18:43:46 +0100")
References: <1392054226-20285-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zjluoeoj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > glibc 2.19 has been released recently
 > (https://sourceware.org/ml/libc-alpha/2014-02/msg00224.html). This
 > commit allows to build a toolchain with this new version. In order to
 > allow this, we add a version selection that did not exist for
 > glibc. We default to 2.18, which was the only supported version until
 > now, and add an option for 2.19.

 > For microblaze, which uses a specific glibc version, the version
 > selection choice is not displayed.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
