From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 19:58:01 +0200
Subject: [Buildroot] [PATCH] linknx: select libcurl to fix autoreconf
In-Reply-To: <20160329173313.GR2637@tarshish>
References: <ad8eed5a1643cc3be56f317dcac61cb1314fc40a.1458157108.git.baruch@tkos.co.il>
 <20160329150549.3e9fdb7c@free-electrons.com>
 <20160329173313.GR2637@tarshish>
Message-ID: <20160329195801.054c3b39@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 20:33:14 +0300, Baruch Siach wrote:

> > It's not super nice to have to add this mandatory dependency for
> > autoreconf, but we indeed don't really have the choice. We should
> > remember to revert this patch once the linknx patch gets merged
> > upstream, and we bump the version. However, it seems like linknx is not
> > super active upstream, so in fact things might just stay forever as they
> > are today. Oh well.
> 
> A possible alternative is to have a local copy of libcurl.m4 for linknx, 
> either in a patch or standalone. Would you prefer that?

Nah, I think it's better to depend on libcurl. It's not like it's a big
dependency, and it's not like linknx is a very important package. So
let's not spend too much time on this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
