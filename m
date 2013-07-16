From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Jul 2013 13:48:52 +0200
Subject: [Buildroot] [PATCHv3 01/14] arch: introduce BR2_GCC_TARGET_{FPU,
	FLOAT_ABI}
In-Reply-To: <1373961805-3901-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 16 Jul 2013 10:03:12 +0200")
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878v163eu3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Buildroot already has the BR2_GCC_TARGET_{TUNE,ARCH,ABI,CPU} hidden
 Thomas> kconfig strings that allow per-architecture Config.in files to feed
 Thomas> the appropriate values of --with-{tune,arch,abi-cpu} when building
 Thomas> gcc, or the appropriate flags for the external toolchain wrapper.

 Thomas> This commit has two additional options:
 Thomas> BR2_GCC_TARGET_{FPU,FLOAT_ABI}, that allows to define the
 Thomas> --with-{fpu,float} gcc configure options for the internal backend, or
 Thomas> the -m{fpu,float-abi} options for the flags of the external toolchain
 Thomas> wrapper.

Committed, thanks.

-- 
Bye, Peter Korsgaard
