From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 10 Mar 2016 13:40:55 +0000
Subject: [Buildroot] [Bug 8781] Unable to build uboot for imx28evk
In-Reply-To: <bug-8781-163@https.bugs.busybox.net/>
References: <bug-8781-163@https.bugs.busybox.net/>
Message-ID: <bug-8781-163-tiAQKEo10g@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8781

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Did you do a "make clean" before doing "make freescale_imx28evk_defconfig" ?

Please make sure you do:

 1/ make clean
 2/ make freescale_imx28evk_defconfig
 3/ make

And attach the complete log of those commands.

FWIW, this defconfig was built yesterday by our Travis CI tests, and it built
fine, see:
https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/114650772.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
