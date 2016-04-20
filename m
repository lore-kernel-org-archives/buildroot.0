From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 23:12:35 +0200
Subject: [Buildroot] [PATCH 2/4] vpnc: simplify patch 0001
In-Reply-To: <20160419220534.GJ3505@free.fr>
References: <1455145392-2355-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1455145392-2355-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160419220534.GJ3505@free.fr>
Message-ID: <20160420231235.1c60b623@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 00:05:34 +0200, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2016-02-11 00:03 +0100, Thomas Petazzoni spake thusly:
> > Patch 0001 that adjusts the Makefile to solve cross-compilation issues
> > does a lot of whitespace changes that are unnecessary. We remove all
> > those noisy changes to keep only the really interesting ones.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks, I've applied the patch!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
