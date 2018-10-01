From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 14:53:53 +0200
Subject: [Buildroot] [PATCH 1/2] arch: drop BR2_GCC_TARGET_CPU_REVISION
 option
In-Reply-To: <20180923203850.19447-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 23 Sep 2018 22:38:49 +0200")
References: <20180923203850.19447-1-thomas.petazzoni@bootlin.com>
 <20180923203850.19447-2-thomas.petazzoni@bootlin.com>
Message-ID: <87wor1rfoe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In commit 325bb37942f8d3826dab9dc6e88b25234e67a2cf, support for the
 > Blackfin architecture was removed. This was our only use of
 > BR2_GCC_TARGET_CPU_REVISION, and since this config option somewhat
 > complicates the calculation of the --with-cpu/-mcpu option values,
 > let's drop it.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
