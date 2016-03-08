From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:16:01 +0100
Subject: [Buildroot] [PATCH v1] qt5tools: qtdiag needs
 BR2_PACKAGE_QT5BASE_GUI
In-Reply-To: <1457388749-11578-1-git-send-email-ps.report@gmx.net>
References: <1457388749-11578-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160308211601.6fae746a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Mon,  7 Mar 2016 23:12:29 +0100, Peter Seiderer wrote:
> Fixes [1]:
> 
>   /usr/bin/make -j4 -C /home/buildroot/autobuild/run/instance-3/output/build/qt5tools-5.5.1/src/qtdiag
>   make[2]: *** No targets specified and no makefile found.  Stop.
> 
> [1] http://autobuild.buildroot.net/results/4ee/4eee2a7cee8fce63b0419668da8bd55b3cfd00af
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5tools/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
