From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 23:47:33 +0100
Subject: [Buildroot] [PATCH v4 2/3] system: Defaulting TZ_LOCALTIME to
 UTC
In-Reply-To: <1423748972-17471-3-git-send-email-angelo.compagnucci@gmail.com>
References: <1423748972-17471-1-git-send-email-angelo.compagnucci@gmail.com>
 <1423748972-17471-3-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150221234733.57baf143@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Thu, 12 Feb 2015 14:49:31 +0100, Angelo Compagnucci wrote:
> This patch sets the default timezone to UTC if not overwritten.
> Some packages need a configured system timezone for properly
> operating like mono based software.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
