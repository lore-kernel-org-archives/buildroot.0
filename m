From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 22:25:43 +0200
Subject: [Buildroot] [PATCH] mpg123: bump to version 1.23.5
In-Reply-To: <1466970497-30351-1-git-send-email-gustavo@zacarias.com.ar>
References: <1466970497-30351-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160626222543.0e662804@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 16:48:17 -0300, Gustavo Zacarias wrote:
> Drop upstreamed patch and related autoreconf.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0001-Makefile.am-don-t-override-LIBS.patch     | 46 ----------------------
>  package/mpg123/mpg123.hash                         |  2 +-
>  package/mpg123/mpg123.mk                           |  4 +-
>  3 files changed, 2 insertions(+), 50 deletions(-)
>  delete mode 100644 package/mpg123/0001-Makefile.am-don-t-override-LIBS.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
