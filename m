From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Sep 2015 12:33:21 +0200
Subject: [Buildroot] [PATCH 1/2] libnetfilter_conntrack: bump to version
 1.0.5
In-Reply-To: <1442006582-20537-1-git-send-email-gustavo@zacarias.com.ar>
References: <1442006582-20537-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150913123321.59e12dbe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 11 Sep 2015 18:23:01 -0300, Gustavo Zacarias wrote:
> Patches upstream so drop them along with autoreconf.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libnetfilter_conntrack/0001-uclinux.patch  | 26 ---------------------
>  .../0002-src-Makefile.am-drop-hardcoded-ldl.patch  | 27 ----------------------
>  .../libnetfilter_conntrack.hash                    |  6 ++---
>  .../libnetfilter_conntrack.mk                      |  4 +---
>  4 files changed, 4 insertions(+), 59 deletions(-)
>  delete mode 100644 package/libnetfilter_conntrack/0001-uclinux.patch
>  delete mode 100644 package/libnetfilter_conntrack/0002-src-Makefile.am-drop-hardcoded-ldl.patch

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
