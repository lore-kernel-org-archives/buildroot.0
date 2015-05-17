From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 May 2015 21:01:19 +0200
Subject: [Buildroot] [PATCH 1/3] qt: do not allow webkit with SuperH
	Sourcery toolchain
In-Reply-To: <1431872140-765-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 17 May 2015 16:15:38 +0200")
References: <1431872140-765-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wq076nb4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Building webkit with the SuperH Sourcery toolchain fails with an
 > assertion in binutils, so let's not allow to select webkit with this
 > toolchain. We do not need to worry about reverse dependencies, since
 > we use the existing BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT symbol to add
 > this new dependency.

 > Fixes:

 >   http://autobuild.buildroot.net/results/508cdeb67f272b61209f331ab7b990cb56f30817/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed all 3, thanks.

-- 
Bye, Peter Korsgaard
