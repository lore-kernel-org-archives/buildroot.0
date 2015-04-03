From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:27:37 +0200
Subject: [Buildroot] [PATCH] toolchains: remove non-LFS toolchain
In-Reply-To: <20150403104432.GN17056@tarshish>
References: <1428057549-24019-1-git-send-email-yann.morin.1998@free.fr>
 <20150403104432.GN17056@tarshish>
Message-ID: <20150403142737.0be7ae94@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Fri, 3 Apr 2015 13:44:32 +0300, Baruch Siach wrote:
> Hi Yann,
> 
> On Fri, Apr 03, 2015 at 12:39:09PM +0200, Yann E. MORIN wrote:
> > Buildroot now requires toolchains to have LFS; it's no longer optional.
> 
> Why not just rebuild this toolchain using current master with LFS?

That's the plan, but until this is done, to fix autobuilder issues,
let's disable this toolchain.

I will rebuild the ARM and PowerPC basic toolchains, and also the SH4
toolchain after applying Waldemar's fix, and then update the
autobuilder configuration accordingly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
