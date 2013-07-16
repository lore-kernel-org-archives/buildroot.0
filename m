From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Jul 2013 15:21:31 +0200
Subject: [Buildroot] [PATCHv3 09/14] toolchain-external: update config
	options after EABIhf introduction
In-Reply-To: <1373961805-3901-10-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 16 Jul 2013 10:03:20 +0200")
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871u6y1vz8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The introduction of the EABIhf ABI requires a few updates to the
 Thomas> configuration options for external toolchains, in order to ensure that
 Thomas> the user doesn't do any invalid selection. In detail:

 Thomas>  * The Linaro ARM toolchains now depend on BR2_ARM_EABIHF, because
 Thomas>    that's the ABI they use, and it is incompatible with EABI. The
 Thomas>    comment about the availability of Linaro toolchains is updated to
 Thomas>    inform users selecting EABI that they should select EABIhf if they
 Thomas>    want to see Linaro toolchains.

 Thomas>  * The Sourcery CodeBench toolchains now depend on BR2_ARM_EABI,
 Thomas>    because that's the ABI they use. A comment is added to inform users
 Thomas>    that have selected EABIhf that Sourcery CodeBench are only
 Thomas>    available when EABI is used.

 Thomas>  * The Arago toolchains now depend on BR2_ARM_EABI, because that's the
 Thomas>    ABI they use. The description of the ARMv7 Arago toolchain is also
 Thomas>    slightly improved.

Committed, thanks.

-- 
Bye, Peter Korsgaard
