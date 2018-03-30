From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:20:48 +0200
Subject: [Buildroot] [PATCH] configs/teliv_evk_pro3: remove defconfig
In-Reply-To: <20180307205323.14440-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 7 Mar 2018 21:53:23 +0100")
References: <20180307205323.14440-1-thomas.petazzoni@bootlin.com>
Message-ID: <87lge91cr3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This defconfig fails to build with gcc 6.x, even though we switched to
 > using gcc 6.x as the default gcc version in May 2017.

 > It hasn't been updated since April 2017, and the original submitter,
 > Fabio Porcedda said:

 >   Unfortunately a newer kernel doesn't boot and I don't have the time
 >   to fix the issue. If having a defconfig that doesn't build on gcc
 >   6.x is unacceptable feel free to remove it.

 > So, let's get rid of this defconfig, which will remove the following
 > build error:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306952

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
