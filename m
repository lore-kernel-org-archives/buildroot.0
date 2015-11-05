From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 10:05:43 +0100
Subject: [Buildroot] [PATCH 0/2] bump libtirpc to 1.0.1
In-Reply-To: <1446712210-14129-1-git-send-email-peda@lysator.liu.se>
References: <1446712210-14129-1-git-send-email-peda@lysator.liu.se>
Message-ID: <20151105100543.4efb53dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Rosin,

On Thu,  5 Nov 2015 09:30:08 +0100, Peter Rosin wrote:

> I'd like to bump libtirpc to 1.0.1. However there is an api incompatibility
> introduced in 0.3.2 which requires a patch to rpcbind, which I took from
> upstream. The rpcbind patch make rpcbind work with either tirpc 0.3.2 or
> 1.0.1, so I added that patch first in the series even if it might seem
> backwards.

Thanks for those patches. Is rpcbind the only user of libtirpc that is
affected by the API change ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
