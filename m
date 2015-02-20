From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 18:56:22 +0100
Subject: [Buildroot] [PATCH] util-linux: bump to version 2.26
In-Reply-To: <1424434219-9898-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424434219-9898-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150220185622.1506bd89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 20 Feb 2015 09:10:19 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/util-linux/0001-sscanf-no-ms-as.patch   |  52 ++------
>  package/util-linux/0004-fix-CVE-2014-9114.patch | 168 ------------------------
>  package/util-linux/Config.in                    |   5 +
>  package/util-linux/util-linux.hash              |   4 +-
>  package/util-linux/util-linux.mk                |  12 +-
>  5 files changed, 24 insertions(+), 217 deletions(-)
>  delete mode 100644 package/util-linux/0004-fix-CVE-2014-9114.patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
