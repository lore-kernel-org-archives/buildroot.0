From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 23:29:00 +0200
Subject: [Buildroot] [PATCH v4] libv4l: bump version to 1.8.0
In-Reply-To: <1444770519-14507-1-git-send-email-ps.report@gmx.net>
References: <1444770519-14507-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151013232900.39ac4c00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 13 Oct 2015 23:08:39 +0200, Peter Seiderer wrote:
> - add qt, qt5base/qt5gui/qt5widgets dependency for qv4l2
>   (qt dependency was missing, qt5 support was added since 1.8.0)
> 
> - fix fix moc/rcc/uic detection in case host versions
>   of moc-qt5, rcc-qt5 or uic-qt5 are present
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v3 -> v4:
>   - simplify qt packet logic (suggested by Thomas Petazzoni)
>   - simplify moc/rcc/uic overwrite (suggested by Thomas Petazzoni)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
