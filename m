From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Feb 2019 13:31:15 +0100
Subject: [Buildroot] [PATCH] configs/rock64: needs U-Boot pylibfdt
In-Reply-To: <20190208120124.8909-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 8 Feb 2019 13:01:24 +0100")
References: <20190208120124.8909-1-thomas.petazzoni@bootlin.com>
Message-ID: <87mun6zcks.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The build currently fails with:
 > *** dtoc needs the Python libfdt library. Either
 > *** install it on your system, or try:
 > ***
 > *** sudo apt-get install swig libpython-dev
 > ***
 > *** to have U-Boot build its own version.

 > Adding BR2_TARGET_UBOOT_NEEDS_PYLIBFDT should fix this build issue,
 > which was reported at:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/158295223

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
