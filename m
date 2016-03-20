From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:32:31 +0100
Subject: [Buildroot] [PATCH 1/5] package/qt5quick1: remove obsolete
 package
In-Reply-To: <1458207749-19507-2-git-send-email-corjon.j@ecagroup.com>
References: <1458207749-19507-1-git-send-email-corjon.j@ecagroup.com>
 <1458207749-19507-2-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20160320233231.03bad31c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 10:42:25 +0100, Julien Corjon wrote:
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/qt5/Config.in                |  1 -
>  package/qt5/qt5quick1/Config.in      | 26 -----------------------
>  package/qt5/qt5quick1/qt5quick1.hash |  2 --
>  package/qt5/qt5quick1/qt5quick1.mk   | 41 ------------------------------------
>  4 files changed, 70 deletions(-)
>  delete mode 100644 package/qt5/qt5quick1/Config.in
>  delete mode 100644 package/qt5/qt5quick1/qt5quick1.hash
>  delete mode 100644 package/qt5/qt5quick1/qt5quick1.mk

Applied patches 1, 2 and 3, after adding the removed
options to Config.in.legacy, as noticed by Peter Seiderer.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
