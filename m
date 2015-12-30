From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 22:37:19 +0100
Subject: [Buildroot] [PATCH 0/4 v2] Do not select providers of virtual
 packages (branch yem/dont-select-providers)
In-Reply-To: <87vb7fvdm9.fsf@dell.be.48ers.dk>
References: <cover.1450391976.git.yann.morin.1998@free.fr>
 <20151218220532.515e1b50@free-electrons.com>
 <87poxnwtm3.fsf@dell.be.48ers.dk>
 <20151230221450.27edf444@free-electrons.com>
 <87vb7fvdm9.fsf@dell.be.48ers.dk>
Message-ID: <20151230223719.219a519c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Wed, 30 Dec 2015 22:19:10 +0100, Peter Korsgaard wrote:

> No, just that the support code to provide lua support probably is quite
> a bit smaller than lua / people are likely to want it if they have lua
> enabled - So it perhaps makes sense to enable it by default.
> 
> You could also argue that we should handle it automatically without a
> sub option like we do for openssl, but that would be a bigger change.

I don't feel very strongly about this. If we have sub-options, then I
don't really see why we should default them to y. But if Yann reads you
and wants to send a patch to do this, I won't oppose to it :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
