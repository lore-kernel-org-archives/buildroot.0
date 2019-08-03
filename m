From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 19:22:18 +0200
Subject: [Buildroot] [PATCH v2 3/4] boot/uboot: add option to pass
 custom variables to U-Boot build
In-Reply-To: <20190426151947.31836-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 26 Apr 2019 17:19:46 +0200")
References: <20190426151947.31836-1-thomas.petazzoni@bootlin.com>
 <20190426151947.31836-4-thomas.petazzoni@bootlin.com>
Message-ID: <87v9ve9nat.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > U-Boot supports a number of environment variables to pass specific
 > information. The following patches were submitted in the past to one
 > some specific Config.in option to pass some of these variables:

 >  - http://patchwork.ozlabs.org/patch/881197/ proposed an option to
 >    pass a custom EXT_DTB= variable

 >  - http://patchwork.ozlabs.org/patch/1018245/ proposed an option to
 >    pass a custom DEVICE_TREE= variable

 > Instead of adding one Config.in option for each of those variables,
 > let's provide a generic mechanism to pass arbitrary variables during
 > U-Boot build step.

 > Cc: Konstantin Porotchkin <kostap@marvell.com>
 > Cc: Clemens Gruber <clemens.gruber@pqgruber.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
