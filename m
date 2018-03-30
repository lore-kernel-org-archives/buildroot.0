From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 21:28:16 +0200
Subject: [Buildroot] [PATCH] configs/firefly_rk3288: remove defconfig
In-Reply-To: <20180305075104.1191-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 5 Mar 2018 08:51:04 +0100")
References: <20180305075104.1191-1-thomas.petazzoni@bootlin.com>
Message-ID: <87a7up4b3j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The original submitter of this defconfig:
 > """
 > Sorry, unfortunately we no longer have the firefly board,
 > so we can't maintain it.
 > """

 > And this defconfig fails to build with gcc 6.x, causing breakage in
 > the defconfig testing.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306815
 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306814

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
