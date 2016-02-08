From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 16:33:05 +0100
Subject: [Buildroot] [PATCHv2] wine: Bump to version 1.8.1
In-Reply-To: <56B8A8B7.7090502@dawncrow.de>
References: <56B8A8B7.7090502@dawncrow.de>
Message-ID: <20160208163305.1f97fe82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?,

On Mon, 8 Feb 2016 15:39:51 +0100, Andr? Hentschel wrote:
> Bumping to stable version 1.8.1
> 
> Upstreamed patch is finally dropped.
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

Thanks, but could you please resend your patch with "git send-email" ?
It doesn't apply here:

thomas at skate:~/projets/buildroot (master)$ git pwam 580310
Applying patch #580310 using 'git am -s -3'
Description: [PATCHv2] wine: Bump to version 1.8.1
Applying: wine: Bump to version 1.8.1
fatal: corrupt patch at line 131
error: could not build fake ancestor
Patch failed at 0001 wine: Bump to version 1.8.1
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

You can reproduce yourself by doing:

$ curl -s http://patchwork.ozlabs.org/patch/580310/mbox/ | git am

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
