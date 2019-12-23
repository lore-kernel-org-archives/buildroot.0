From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 19:01:45 +0100
Subject: [Buildroot] [PATCH] configs/licheepi_zero: U-Boot needs pylibfdt
In-Reply-To: <20191216094010.1749054-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 16 Dec 2019 10:40:09 +0100")
References: <20191216094010.1749054-1-thomas.petazzoni@bootlin.com>
Message-ID: <87h81qvs3a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Like all Allwinner platforms, building the licheepi_zero U-Boot
 > configuration requires pylibfdt.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/378314331

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
