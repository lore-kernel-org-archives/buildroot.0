From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Dec 2015 23:03:46 +0100
Subject: [Buildroot] [PATCH] trace-cmd: bump to version 2.6
In-Reply-To: <1450731919-28110-1-git-send-email-sergio.prado@e-labworks.com>
References: <1450731919-28110-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20151221230346.3d251495@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Mon, 21 Dec 2015 19:05:19 -0200, Sergio Prado wrote:
> Also remove no longer needed patch (fixed upstream).
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  package/trace-cmd/0001-Fix-ptrace-detection.patch | 36 -----------------------
>  package/trace-cmd/trace-cmd.mk                    |  2 +-
>  2 files changed, 1 insertion(+), 37 deletions(-)
>  delete mode 100644 package/trace-cmd/0001-Fix-ptrace-detection.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
