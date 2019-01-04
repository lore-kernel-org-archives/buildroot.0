From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Jan 2019 12:50:30 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain-external: update Arm ARM
 toolchain 8.2-2018.11
In-Reply-To: <20190102221407.11603-1-romain.naour@gmail.com> (Romain Naour's
 message of "Wed, 2 Jan 2019 23:14:05 +0100")
References: <20190102221407.11603-1-romain.naour@gmail.com>
Message-ID: <87muogmyk9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > From [1]:
 > * All GCC 8.2 features. For details on GCC 8 release series.
 > * Linaro specific pre-processor macros to ensure that this is a
 >   continuation from the Linaro releases.
 > * Spectre v1 mitigation backport from upstream FSF trunk include the
 >   revisions. This is an initial backport of those mitigations in
 >   the GNU toolchain and should be regarded as support for prototyping
 >   and early access only. Moreover, while the backports include support
 >   for the other architectures, they are included for completeness and
 >   all issues regarding these patches must be taken up upstream in the
 >   https://gcc.gnu.org/bugzilla by reproducing the same with upstream
 >   FSF trunk.
 >   Arm is interested in feedback regarding these workarounds for
 >   Spectre v1.
 >   A description of the mitigation has been published on LWN.net.

 > See "Release Note":
 > [1] https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#

 > Tested with qemu_arm_vexpress_defconfig.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed all 3, thanks.

-- 
Bye, Peter Korsgaard
