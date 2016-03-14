From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Mar 2016 23:39:18 +0100
Subject: [Buildroot] [PATCH v2] package/kbd: fix not installing to the
 target
In-Reply-To: <1457347031-12817-1-git-send-email-martin@barkynet.com>
References: <1457347031-12817-1-git-send-email-martin@barkynet.com>
Message-ID: <20160314233918.7f6d631e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Mon,  7 Mar 2016 10:37:11 +0000, Martin Bark wrote:
> Commit https://git.busybox.net/buildroot/commit/?id=9f81bad fixed a build
> error in kbd but unfortunately it broke the target install rule so that
> nothing is being installed.
> 
> Add the missing DESTDIR=$(TARGET_DIR) install to KBD_INSTALL_TARGET_OPTS
> so that it installs to the target again.
> 
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Martin Bark <martin@barkynet.com>

Peter applied a similar patch from a different contributor. See
https://git.busybox.net/buildroot/commit/?id=28a55b66897f97e3acad36549a4c9e02e7f5dc22.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
