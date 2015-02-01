From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 22:27:21 +0100
Subject: [Buildroot] [PATCH v1] util-linux: disable more command host
 build because of ncurses dependency
In-Reply-To: <1422736111-11769-1-git-send-email-ps.report@gmx.net>
References: <1422736111-11769-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150201222721.45b546e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sat, 31 Jan 2015 21:28:31 +0100, Peter Seiderer wrote:
> Build on host without ncurses/curses development files and option
> HOST_UTIL_LINUX enabled (introduced by [1]) failes because of
> text-utils/more.c ncurses dependency (see old commit [2] for details).
> 
> [1] http://git.buildroot.net/buildroot/commit/?id=2b18d093cd8a5baaf2e22ce13cc9e527c1937777
> [2] http://git.buildroot.net/buildroot/commit/?id=e55532fa08266be268fa35c32a5ee763329a9396
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/util-linux/util-linux.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
