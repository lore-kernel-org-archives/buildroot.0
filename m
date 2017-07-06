From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jul 2017 11:55:15 +0200
Subject: [Buildroot] [PATCH] xvisor: fix bogus check on XVISOR_ARCH
In-Reply-To: <20170706094229.18820-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 6 Jul 2017 11:42:29 +0200")
References: <20170706094229.18820-1-thomas.petazzoni@free-electrons.com>
Message-ID: <877ezlyjng.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The XVISOR_ARCH check added in commit
 > 117fd5dfbc756c4f2b4aef97fc2b568528c66df7 ("xvisor: fix build on
 > AArch64") broke Buildroot entirely on all architectures except ARM,
 > AArch64 and x86-64, because the $(error ...) test was not enclosed
 > inside a condition that made sure the xvisor package was enabled.

 > This commit fixes that, and allows Buildroot to be usable again on all
 > architectures.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
