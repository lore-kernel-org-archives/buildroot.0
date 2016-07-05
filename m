From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:59:01 +0200
Subject: [Buildroot] [PATCH 02/24 v2] system: sysvinit only selects
 busybox-show-others if busybox is enabled
In-Reply-To: <20160704164917.GG3549@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <a6739dce77434d44e657409dcc953ec3532789c1.1466622379.git.yann.morin.1998@free.fr>
 <927864ad-b946-bf1a-8317-c8244fc8358a@gmail.com>
 <20160704164917.GG3549@free.fr>
Message-ID: <20160705155901.6c0e7d76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Jul 2016 18:49:17 +0200, Yann E. MORIN wrote:

> Indeed, but in retrospect, I think I should drop this patch
> altogether...

Following this, I've marked this patch as Rejected. It's indeed simpler
to just select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, even if technically
when Busybox is disabled, this symbol is always set to 'y'.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
