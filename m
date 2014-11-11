From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Nov 2014 21:32:28 +0100
Subject: [Buildroot] [PATCH] toolchain-external: update Linaro toolchains
In-Reply-To: <1415613991-19261-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 10 Nov 2014 11:06:31 +0100")
References: <1415613991-19261-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87389po4v7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Bump the ARM, ARMeb and AArch64 Linaro toolchains from 14.08 to
 > 14.09. We can't bump to 14.10, because they completely changed the
 > toolchains and they are now completely broken: they switched from
 > Crosstool-NG to a new build tool to generate the toolchain, and now
 > the sysroot handling is completely borked.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

I see this also has libubsan, so we should probably look into handling
-fsanitize / copy that library in the future.

-- 
Bye, Peter Korsgaard
