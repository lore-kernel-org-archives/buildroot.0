From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 14:16:11 +0100
Subject: [Buildroot] [PATCH] iptables: fix build with musl
In-Reply-To: <20170302105716.zjqthvskb4bqvml5@tarshish>
References: <045cb32775a51576353bc4aa73dcc5fa8b554864.1488441240.git.baruch@tkos.co.il>
 <20170302092304.0f16c801@free-electrons.com>
 <20170302105716.zjqthvskb4bqvml5@tarshish>
Message-ID: <20170302141611.13a65685@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Mar 2017 12:57:16 +0200, Baruch Siach wrote:

> > Applied to master, thanks. Peter: I believe this one is *not* needed
> > for the LTS branch, because it fixes a problem with the iptables 1.6.1
> > bump, which was merged after the 2017.02 release. Baruch, could you
> > confirm?  
> 
> It's true that this issue does not effect 2017.02, but not because of the 
> iptables version. In 2017.02 iptables is disabled for musl build. Commit 
> 6a27508ffb (Revert "package/iptables: nfsynproxy not available on musl") that 
> enabled musl was applied to next.

OK. Thanks for the explanation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
