From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 15:48:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/tinyhttpd: remove package
In-Reply-To: <20200517083832.1717761-1-fontaine.fabrice@gmail.com>
References: <20200517083832.1717761-1-fontaine.fabrice@gmail.com>
Message-ID: <20200904154848.33b6651e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 May 2020 10:38:32 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> tinyhttpd is affected by CVE-2002-1819 and is not maintained anymore (no
> release since 2001) so remove it
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Config.in.legacy                        |  8 +++
>  package/Config.in                       |  1 -
>  package/tinyhttpd/0001-misc-fixes.patch | 80 -------------------------
>  package/tinyhttpd/Config.in             |  9 ---
>  package/tinyhttpd/S85tinyhttpd          | 32 ----------
>  package/tinyhttpd/tinyhttpd.hash        |  3 -
>  package/tinyhttpd/tinyhttpd.mk          | 32 ----------
>  package/tinyhttpd/tinyhttpd.service     | 10 ----
>  8 files changed, 8 insertions(+), 167 deletions(-)
>  delete mode 100644 package/tinyhttpd/0001-misc-fixes.patch
>  delete mode 100644 package/tinyhttpd/Config.in
>  delete mode 100644 package/tinyhttpd/S85tinyhttpd
>  delete mode 100644 package/tinyhttpd/tinyhttpd.hash
>  delete mode 100644 package/tinyhttpd/tinyhttpd.mk
>  delete mode 100644 package/tinyhttpd/tinyhttpd.service

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
