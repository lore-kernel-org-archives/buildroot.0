From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Jul 2014 16:17:48 +0200
Subject: [Buildroot] [PATCH 06/10] uclibc: remove BR2_UCLIBC_ARM_TYPE
In-Reply-To: <1404237789-15563-7-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 1 Jul 2014 20:03:05 +0200")
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404237789-15563-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87lhs1pab7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The BR2_UCLIBC_ARM_TYPE was only used for uClibc 0.9.32 on ARM. Now
 > that only uClibc 0.9.33 is supported for ARM, there is no point in
 > keeping BR2_UCLIBC_ARM_TYPE, since the corresponding uClibc options no
 > longer exist.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
