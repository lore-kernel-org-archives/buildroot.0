From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 14:37:03 +0200
Subject: [Buildroot] [PATCH] gst-fsl-plugins: Refresh one patch to fix
 build
In-Reply-To: <1396604842-20049-1-git-send-email-vincent.stehle@freescale.com>
References: <1396604842-20049-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <20140406143703.65e10aaf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent Stehl?,

On Fri, 4 Apr 2014 11:47:22 +0200, Vincent Stehl? wrote:
> This fixes the following patch application error when building for i.MX6:
> 
>   Applying gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch using patch:
>   patching file configure.ac
>   Hunk #1 succeeded at 178 with fuzz 2 (offset 5 lines).
>   patching file libs/Makefile.am
>   Hunk #1 FAILED at 12.
>   1 out of 1 hunk FAILED -- saving rejects to file libs/Makefile.am.rej
>   Patch failed!  Please fix gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch!
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Eric Nelson <eric.nelson@boundarydevices.com>
> ---
>  ...gstfsl-linkage-add-lrt-for-shared-memory-func.patch | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
