From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 00:01:52 +0200
Subject: [Buildroot] [PATCH 2/2] qt5connectivity: add QtNfc submodule
In-Reply-To: <20160413235317.604bbd46@free-electrons.com>
References: <1459763762-31640-1-git-send-email-corjon.j@ecagroup.com>
 <1459763762-31640-2-git-send-email-corjon.j@ecagroup.com>
 <20160413235317.604bbd46@free-electrons.com>
Message-ID: <20160419000152.7bae41fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Apr 2016 23:53:17 +0200, Thomas Petazzoni wrote:

> So until now, neard was not necessary, and without any version bump or
> anything, it should become a mandatory dependency? This seems weird,
> and does not quite follow the policy of Buildroot that we should have
> as much as possible the smallest set of mandatory dependencies.

I just tested, and indeed you can build Qt5Connectivity without
Bluetooth support and have only NFC support. Or build only Bluetooth
support without NFC support.

So could you make these optional?

I'll mark your patch as Changes Requested in patchwork in the mean time.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
