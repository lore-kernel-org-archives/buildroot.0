From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 20:23:39 +0200
Subject: [Buildroot] [PATCH] package/gdb: fix uClibc build whitout MMU
In-Reply-To: <1428700329-670-1-git-send-email-romain.naour@openwide.fr>
References: <1428700329-670-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150411202339.2fea3d95@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 10 Apr 2015 23:12:09 +0200, Romain Naour wrote:
> Fixes:
> http://autobuild.buildroot.net/results/9e4/9e4df085319e346803c26c65478accb27eb950ae
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  .../0001-gdbserver-fix-uClibc-whithout-MMU.patch   | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/gdb/7.8.2/0001-gdbserver-fix-uClibc-whithout-MMU.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
