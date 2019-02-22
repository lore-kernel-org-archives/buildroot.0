From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 22:29:11 +0100
Subject: [Buildroot] [PATCH] configs/orangepi_{lite2,
 one_plus}: use correct kernel headers version
In-Reply-To: <20190222211305.15300-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 22 Feb 2019 22:13:05 +0100")
References: <20190222211305.15300-1-thomas.petazzoni@bootlin.com>
Message-ID: <877edrikbc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In the following commits:
 > 85f4bd9425b4ee74839202ab012d193a0175c5fa configs/orangepi_lite2: fix kernel headers option
 > 506cdeb2d08811f309c6dc80c0098bf1ccdee21a configs/orangepi_one_plus: fix kernel headers option

 > We fixed the orangepi_lite2 and orangepi_one_plus defconfigs to use
 > the BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_X_Y option. However, we were
 > mistaken by the existing comment saying that 4.18 kernel headers
 > should be used. This was wrong, as the kernel source code in use is
 > 4.19, so this commit fixes the
 > BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_X_Y to use the correct version.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/165766089
 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/165766093

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
