From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 17 Jul 2018 19:31:21 +0200
Subject: [Buildroot] [PATCH] sunxi-mali-mainline-driver: bump version
In-Reply-To: <20180717160725.51894-1-giulio.benetti@micronovasrl.com>
References: <20180717160725.51894-1-giulio.benetti@micronovasrl.com>
Message-ID: <468af24d-9c8c-ad6c-f22f-40832a123c9d@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 17/07/2018 18:07, Giulio Benetti ha scritto:
> For support H3 and H5 SoCs.

I've just found out that r6p2(arm64) and r8p1(arm & arm64) have been 
released.
So this package needs more work to be done like adding r8p1 choice
and consequently sunxi-mali-mainline needs other work to integrate.

So please drop this patch as I'm going to send a patchset to add support 
for:
- r6p2
- r6p2 64-bit
- r8p1
- r8p1 64-bit

Thanks
Giulio Benetti
