From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Dec 2018 20:51:31 +0100
Subject: [Buildroot] [PATCH] configs/bananapi_m2_ultra: add kernel
 headers version option
In-Reply-To: <20181208145015.3095-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 8 Dec 2018 15:50:14 +0100")
References: <20181208145015.3095-1-thomas.petazzoni@bootlin.com>
Message-ID: <87o99v4x18.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The bananapi_m2_plus defconfig uses a 4.18 kernel, but doesn't specify
 > anything for the kernel headers version, so the Buildroot default gets
 > used, which currently is 4.19. Since 4.19 is newer than 4.18,
 > Buildroot rightfully whines:

 >   Incorrect selection of kernel headers: expected 4.19.x, got 4.18.x

 > Let's fix this by telling this defconfig to use the headers from the
 > kernel, and that they are of version 4.18.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/131216938

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
