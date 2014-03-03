From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 21:26:29 +0100
Subject: [Buildroot] [PATCH] samba4: fix readline support
In-Reply-To: <1393847052-13062-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393847052-13062-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140303212629.422c3d21@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  3 Mar 2014 08:44:12 -0300, Gustavo Zacarias wrote:
> Add automatic readilne support since it's used when available.
> Also add a patch to update to new-style typedefs that were removed from
> readline 6.3 that causes build breakage. Fixes:
> http://autobuild.buildroot.net/results/b13/b137c237ff6df81dd10f7895278d1f2f5d2326de/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...line-switch-to-new-style-readline-typedef.patch | 32 ++++++++++++++++++++++
>  package/samba4/samba4.mk                           |  3 +-
>  2 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 package/samba4/samba4-0006-smbreadline-switch-to-new-style-readline-typedef.patch

Thanks, applied, after fixing the minor nit noticed by Baruch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
