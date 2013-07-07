From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Jul 2013 22:45:51 +0200
Subject: [Buildroot] [PATCH 0/8] ARM floating point improvements and
	EABIhf support
In-Reply-To: <1373123292-15085-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 6 Jul 2013 17:08:04 +0200")
References: <1373123292-15085-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwpygku8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here is a patch series that improves the support for the various
 Thomas> floating point possibilities on ARM, and adds support for the new
 Thomas> EABIhf ARM ABI. Until now, we only had a global BR2_SOFT_FLOAT option
 Thomas> to enable/disable soft-float support, and on ARM a BR2_VFP_FLOAT
 Thomas> option to enable -mfpu=vfp. This clearly isn't sufficient to take into
 Thomas> the various possibilities offered by the Cortex-A ARM cores.

Series looks good (+/- the minor issues I mentioned), but I will wait
until you send an update with the oabi stuff from Yann integrated.

-- 
Bye, Peter Korsgaard
