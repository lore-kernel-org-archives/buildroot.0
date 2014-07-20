From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 11:38:10 +0200
Subject: [Buildroot] [PATCH 6/8] libglu: New package
In-Reply-To: <1405575780-26496-7-git-send-email-bernd.kuhls@t-online.de>
References: <1405575780-26496-1-git-send-email-bernd.kuhls@t-online.de>
 <1405575780-26496-7-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140720113810.5eb5a177@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 17 Jul 2014 07:42:58 +0200, Bernd Kuhls wrote:
> This package is needed for OpenGL support in xbmc:
> https://github.com/xbmc/xbmc/blob/Gotham/configure.in#L1070
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in        |    1 +
>  package/libglu/Config.in |   10 ++++++++++
>  package/libglu/libglu.mk |   17 +++++++++++++++++
>  3 files changed, 28 insertions(+)
>  create mode 100644 package/libglu/Config.in
>  create mode 100644 package/libglu/libglu.mk

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
