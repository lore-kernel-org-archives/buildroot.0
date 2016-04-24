From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:43:18 +0200
Subject: [Buildroot] [PATCH v1] qt5base: fix sparc glibc libatomic link
 problem
In-Reply-To: <1461444057-5408-1-git-send-email-ps.report@gmx.net>
References: <1461444057-5408-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160424234318.6bbdcf60@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Apr 2016 22:40:57 +0200, Peter Seiderer wrote:
> Fixes [1]:
> 
>   undefined reference to `__atomic_fetch_add_4'
> 
> Upstream patch from QTBUG-51621 ([2], [3]).
> 
> [1] http://autobuild.buildroot.net/results/8e7/8e7ff74abdd6274c257a928113e50f534a142650
> [2] https://bugreports.qt.io/browse/QTBUG-51621
> [3] https://codereview.qt-project.org/#/c/151273/3
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  .../0007-build-with-explicitlib-after-all.patch    | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/qt5/qt5base/0007-build-with-explicitlib-after-all.patch

I must say I don't really understand the patch itself as it's really
arcane qmake stuff, but since it's upstream, I guess it's good :-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
