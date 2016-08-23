From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 15:00:28 +0200
Subject: [Buildroot] [PATCH 1/1] python-pyqt: Removed 'compileall'
 directive from INSTALL_TARGET_CMDS
In-Reply-To: <20160823105649.1267-1-develop@manuel-voegele.de>
References: <20160823105649.1267-1-develop@manuel-voegele.de>
Message-ID: <20160823150028.18bbac29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 12:56:49 +0200, Manuel V?gele wrote:
> Since all python modules are now byte-compiled globally this is no
> longer necessary.
> 
> Signed-off-by: Manuel V?gele <develop@manuel-voegele.de>
> ---
>  package/python-pyqt/python-pyqt.mk | 3 ---
>  1 file changed, 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
