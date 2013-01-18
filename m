From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jan 2013 16:23:01 +0100
Subject: [Buildroot] [PATCH v2] pkg-infra: add <pkg>_CONFIG_FIXUP to fix
 *-config files
In-Reply-To: <50F946E5.20903@petroprogram.com>
References: <1357847559-31530-1-git-send-email-stefan.froberg@petroprogram.com>
 <1357847559-31530-2-git-send-email-stefan.froberg@petroprogram.com>
 <50F08535.509@mind.be> <50F0BE8A.8000502@petroprogram.com>
 <50F7B710.2000703@mind.be> <50F946E5.20903@petroprogram.com>
Message-ID: <20130118162301.2a62ea79@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Fri, 18 Jan 2013 14:58:13 +0200, Stefan Fr?berg wrote:

> Sounds good but what about that <pkg>_CONFIG_FIXUP variable that was
> started from Gustavo suggestion (originally from divine-config: fixup
> thread) ?
> 
> http://lists.busybox.net/pipermail/buildroot/2013-January/064656.html
> 
> Was it now totally waste of time ?  :-(

No, I think it's good. We should just give it some testing, add a bit
of documentation, and that's it. But in general, I'm in favor of this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
