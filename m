From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 15:01:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/psmisc: fix musl build
In-Reply-To: <1454242565-13780-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454242565-13780-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207150120.75e3ceac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 31 Jan 2016 13:16:05 +0100, Bernd Kuhls wrote:
> Add upstream commit fixing a build error not yet been found by the
> autobuilders:
> 
> pstree.c: In function ?get_threadname?:
> pstree.c:798:15: error: ?PATH_MAX? undeclared (first use in this function)
>      char path[PATH_MAX + 1];
>                ^
> pstree.c:798:15: note: each undeclared identifier is reported only once for each function it appears in
> pstree.c:798:10: warning: unused variable ?path? [-Wunused-variable]
>      char path[PATH_MAX + 1];
>           ^
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/psmisc/psmisc.hash | 1 +
>  package/psmisc/psmisc.mk   | 2 ++
>  2 files changed, 3 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
