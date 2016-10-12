From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Oct 2016 13:58:25 +0200
Subject: [Buildroot] [PATCH] package/upmpdcli: bump to version 1.2.8
In-Reply-To: <20161011195503.26904-1-joerg.krause@embedded.rocks>
References: <20161011195503.26904-1-joerg.krause@embedded.rocks>
Message-ID: <20161012135825.2e95f6ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Oct 2016 21:55:03 +0200, J?rg Krause wrote:
> Remove patches applied upstream. As we are not touching configure.ac or
> Makefile.am anymore there is no need for AUTORECONF.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/upmpdcli/0001-fix-jsoncpp-detection.patch  |  90 -----------------
>  .../0002-use-pkg-config-for-libupnpp.patch         |  66 -------------
>  ...including-header-file-log.h-from-libupnpp.patch | 110 ---------------------
>  ...ig-for-jsoncpp-libmpdclient-libmicrohttpd.patch | 105 --------------------
>  package/upmpdcli/upmpdcli.hash                     |   2 +-
>  package/upmpdcli/upmpdcli.mk                       |   6 +-
>  6 files changed, 2 insertions(+), 377 deletions(-)
>  delete mode 100644 package/upmpdcli/0001-fix-jsoncpp-detection.patch
>  delete mode 100644 package/upmpdcli/0002-use-pkg-config-for-libupnpp.patch
>  delete mode 100644 package/upmpdcli/0003-Fix-including-header-file-log.h-from-libupnpp.patch
>  delete mode 100644 package/upmpdcli/0004-Use-pkg-config-for-jsoncpp-libmpdclient-libmicrohttpd.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
