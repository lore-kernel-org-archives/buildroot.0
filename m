From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 18:00:16 +0100
Subject: [Buildroot] [PATCH 1/6] configs/imx6-sabresd_qt5: add missing
 dependency on host-openssl
In-Reply-To: <20181122094150.10403-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 22 Nov 2018 10:41:44 +0100")
References: <20181122094150.10403-1-thomas.petazzoni@bootlin.com>
Message-ID: <87tvk3vknz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > host-openssl is needed to build the Linux kernel. This is the same
 > issue that was fixed in commit
 > 5dac3b9b8d72ea2b4aa264bfaa54e41f32595009 ("configs/imx6-sabresd: needs
 > host-openssl for the Linux kernel build") for the minimal defconfig
 > for the same board.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/123771070

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
