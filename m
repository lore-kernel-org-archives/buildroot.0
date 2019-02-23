From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Feb 2019 09:54:00 +0100
Subject: [Buildroot] [PATCH] configs/imx23evk: Bump the U-Boot version
In-Reply-To: <20190223002843.16473-1-festevam@gmail.com> (Fabio Estevam's
 message of "Fri, 22 Feb 2019 21:28:43 -0300")
References: <20190223002843.16473-1-festevam@gmail.com>
Message-ID: <87r2byholz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > Thomas Petazzoni reports:
 > "The imx23evk_defconfig no longer builds:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/158295124

 > This is due to the bump of OpenSSL to 1.1.x. This issue seems to have
 > been fixed in U-Boot commit 7bae13b7579a6bc42330427496330fe2a29cbd56,
 > which is part of U-Boot since 2017.01, but the defconfig is using
 > 2016.09."

 > Bump to the U-Boot 2019.01 to fix this problem.

 > Fixes:  https://gitlab.com/buildroot.org/buildroot/-/jobs/158295124

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Fabio Estevam <festevam@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
