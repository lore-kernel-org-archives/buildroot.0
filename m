From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Nov 2013 15:15:25 +0100
Subject: [Buildroot] [PATCH] gpsd: do not allow profiling support on
	AArch64
In-Reply-To: <1385630287-14110-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 28 Nov 2013 10:18:07 +0100")
References: <1385630287-14110-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8738mg1uki.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The profiling support is not available on AArch64, causing build
 > failures such as:

 >   http://autobuild.buildroot.net/results/724f8646e1c2c28cf187f2313244d1e3e61b4c25/

 > According to Will Newton, function profiling will only be added in the
 > next version of the AArch64 Linaro toolchain. This indicates it is a
 > rather new feature in AArch64, so for the moment, just disallow
 > profiling on AArch64. We can revise this later, when this feature has
 > been made available in Linaro toolchains, and official gcc releases
 > (for internal toolchain support).

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
