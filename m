From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 14:01:09 +0200
Subject: [Buildroot] [PATCH v4 04/11] package/mesa3d: enable llvm support
In-Reply-To: <6cbae11f-1fc3-e46e-dddc-5bdbcb8a0ce0@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-5-valentin.korenblit@smile.fr>
 <20180401225302.3a4284cd@windsurf>
 <6cbae11f-1fc3-e46e-dddc-5bdbcb8a0ce0@smile.fr>
Message-ID: <20180402140109.0d625231@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 2 Apr 2018 12:05:51 +0200, Valentin Korenblit wrote:

> > Should the option be: bool "llvmpipe" ? Or is LLVM used by mesa3d for
> > something else ?  
> 
> We could leave "LLVM" because llvmpipe is not the only feature, r600 needs
> llvm AMDGPU backend when llvm is selected, and then we could add radeonsi
> Gallium Driver for newer GPUs.

OK, so "llvm support" would be appropriate.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
