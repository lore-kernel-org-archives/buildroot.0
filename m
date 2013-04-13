From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Apr 2013 20:11:07 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix Linaro ARM URL
In-Reply-To: <1365871027-23808-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 13 Apr 2013 18:37:07 +0200")
References: <1365871027-23808-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r4iepah0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Commit 79828fc01d92cee84f8703d25f72121f52880ee9 (toolchain-external:
 Thomas> update ARM Linaro toolchains) accidently broke the URL for the Linaro
 Thomas> 2013.01 toolchain by replacing a .bz2 extension by .bz. This patch
 Thomas> fixes this problem.

Committed, thanks.

-- 
Bye, Peter Korsgaard
