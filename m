From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 21:28:01 +0200
Subject: [Buildroot] [PATCH] configs/ci40: remove defconfig
In-Reply-To: <20180305082515.2565-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 5 Mar 2018 09:25:15 +0100")
References: <20180305082515.2565-1-thomas.petazzoni@bootlin.com>
Message-ID: <87efk14b3y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > From the original submitter of this defconfig:
 > """
 > I no longer have access to ci40 board. It would be difficult for me to
 > maintain it.
 > """

 > And this defconfig currently fails to build with gcc 6.x. Therefore,
 > drop it.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306806

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
