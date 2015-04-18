From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:37:06 +0200
Subject: [Buildroot] [PATCH 2/2] uclibc: drop -ng 1.0.0 stray patch
In-Reply-To: <1429217745-3205-2-git-send-email-gustavo@zacarias.com.ar>
References: <1429217745-3205-1-git-send-email-gustavo@zacarias.com.ar>
 <1429217745-3205-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150418153706.1a746d80@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 16 Apr 2015 17:55:45 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...-guard-tcb-offsets.h-include-with-RESET_P.patch | 31 ----------------------
>  1 file changed, 31 deletions(-)
>  delete mode 100644 package/uclibc/1.0.0/0001-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
