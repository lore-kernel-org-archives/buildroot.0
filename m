From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Jul 2013 15:12:33 +0200
Subject: [Buildroot] [PATCHv3 03/14] arch: improve ARM floating point
	support and add support for EABIhf
In-Reply-To: <1373961805-3901-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 16 Jul 2013 10:03:14 +0200")
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r4ey1we6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit introduces the support for the EABIhf ABI, next to the
 Thomas> existing support we have for EABI and OABI (even though OABI support
 Thomas> is deprecated). EABIhf allows to improve performance of floating point
 Thomas> workload by using floating point registers to transfer floating point
 Thomas> arguments when calling functions, instead of using integer registers
 Thomas> to do, as is done in the 'softfp' floating point model of EABI.

Committed, thanks.

-- 
Bye, Peter Korsgaard
