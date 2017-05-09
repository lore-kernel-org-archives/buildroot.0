From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 09 May 2017 17:12:25 +0200
Subject: [Buildroot] [PATCH v2 0/4] mpir build fixes
In-Reply-To: <1494272750-20723-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 8 May 2017 21:45:46 +0200")
References: <1494272750-20723-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871srynjxi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > This new version of the mpir build fixes series now fixes the build
 > for all 49 toolchain configurations, tested with the test-pkg script.

 > Changes since v1:

 >  - Fix a typo in the mips32r6/mips64r6 that originally made it useless
 >    (BR2_mips32r6 was used, while the option is name BR2_mips_32r6)

 >  - Add a patch to fix the powerpc64le build

 > Best regards,

 > Thomas

 > Thomas Petazzoni (4):
 >   mpir: fix build on ARM with old binutils versions
 >   mpir: fix build on ARM Thumb-only platforms
 >   mpir: fix build on mips32r6/mips64r6
 >   mpir: fix build on powerpc64le

Committed all 4, thanks.

-- 
Bye, Peter Korsgaard
