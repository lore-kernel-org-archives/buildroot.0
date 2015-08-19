From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2015 22:23:03 +0200
Subject: [Buildroot] [PATCH v1 0/2] Checking whether a certain CONFIG_*
 is set
In-Reply-To: <20150819192157.GC13372@free.fr>
References: <87lhd98twt.fsf@dell.be.48ers.dk>
 <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
 <20150819194643.1fad6062@free-electrons.com>
 <20150819190534.GA13372@free.fr>
 <20150819210830.6c52ebed@free-electrons.com>
 <20150819192157.GC13372@free.fr>
Message-ID: <20150819222303.2f2c17ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 19 Aug 2015 21:21:57 +0200, Yann E. MORIN wrote:

> > We already do your second item.
> 
> No, we are not allowing any random package to set kernel options.

No, we do it the other way around: linux.mk tweaks the kernel options
depending on which packages are selected.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
