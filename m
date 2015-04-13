From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 22:23:06 +0200
Subject: [Buildroot] [PATCH v1] qt: fix postgresql plugin configure
In-Reply-To: <1428953436-1124-1-git-send-email-ps.report@gmx.net>
References: <1428953436-1124-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150413222306.47c57ece@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Mon, 13 Apr 2015 21:30:36 +0200, Peter Seiderer wrote:
> Add upstream patch (see [1], [2]) which fixes a bug introduced by previous
> patch '0007-configure-add-psql_config-option.patch'.
> 
> [1] https://bugreports.qt.io/browse/QTBUG-45463
> [2] https://codereview.qt-project.org/110041
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...erIncludePath-and-filterLibraryPath-usage.patch | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/qt/0008-Remove-filterIncludePath-and-filterLibraryPath-usage.patch

Applied, thanks. However, it would be good to update patch 0007 with a
reference to the upstream commit.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
