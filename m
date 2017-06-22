From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Jun 2017 13:06:45 +0200
Subject: [Buildroot] [PATCH 2/2] configs/cubieboard2_defconfig: use
	U-Boot boot script generation logic
In-Reply-To: <20170621214143.7184-2-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 21 Jun 2017 23:41:43 +0200")
References: <20170621214143.7184-1-thomas.petazzoni@free-electrons.com>
 <20170621214143.7184-2-thomas.petazzoni@free-electrons.com>
Message-ID: <87d19wi8my.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Instead of a custom post-build script, use the boot script generation
 > logic of the U-Boot package.

Committed, thanks.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > This is just one example on one specific platform of what it looks
 > like. If we agree on the feature, my intent is to rework all the
 > existing boards that generate such a boot script.

Great, thanks!

-- 
Bye, Peter Korsgaard
