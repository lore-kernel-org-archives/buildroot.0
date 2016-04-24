From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 17:21:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: bump version to 1.7.2
In-Reply-To: <1461506200-8175-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461506200-8175-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160424172125.677c4b76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Apr 2016 15:56:40 +0200, Bernd Kuhls wrote:
> Removed patches applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/jsoncpp/0001-Remove-Werror.patch           | 39 -------------
>  .../0002-Add-option-JSONCPP_WITH_STRICT_ISO.patch  | 68 ----------------------
>  package/jsoncpp/jsoncpp.mk                         |  2 +-
>  3 files changed, 1 insertion(+), 108 deletions(-)
>  delete mode 100644 package/jsoncpp/0001-Remove-Werror.patch
>  delete mode 100644 package/jsoncpp/0002-Add-option-JSONCPP_WITH_STRICT_ISO.patch

Applied to master, thanks. Since jsoncpp is fetched from github, adding
a hash file would be good :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
