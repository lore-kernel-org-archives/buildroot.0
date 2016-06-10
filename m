From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 20:17:59 +0200
Subject: [Buildroot] [PATCH RESEND] Bump linux kernel and u-boot versions
In-Reply-To: <1465566116-28333-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1465566116-28333-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Message-ID: <20160610201759.0907abc5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Jun 2016 16:41:56 +0300, Eugeniy Paltsev wrote:
> Update kernel version to the most recent stable as of today 4.6.2
> with back-ported ARC PGU support from 4.7-rc2.
> 
> Bump u-boot to 2016.05 release.
> Add 1 u-boot patch to disable IOC.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>

This version does not use 4.7-rc2, and still have zillions have patches
due to this. And the commit log therefore doesn't match what the patch
is doing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
