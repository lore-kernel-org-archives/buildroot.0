From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 22:14:21 +0200
Subject: [Buildroot] [PATCH] package/sysdig: fix incorrect module name
In-Reply-To: <1502692548-20503-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1502692548-20503-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20170814221421.78ddfa01@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Aug 2017 08:35:48 +0200, Angelo Compagnucci wrote:
> Latest version of sysdig introduced a variable for the kernel module
> name. This patch updates that variable into Makefile.in.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/sysdig/sysdig.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
