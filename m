From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 13:55:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/thttpd: security bump to
 version 2.29
In-Reply-To: <20190330154631.28343-1-fontaine.fabrice@gmail.com>
References: <20190330154631.28343-1-fontaine.fabrice@gmail.com>
Message-ID: <20190331135555.16f9d2bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Mar 2019 16:46:31 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch site to "real" upstream instead of debian as debian does not
>   have latest version
> - Drop patch (not needed anymore as getline was renamed in my_getline)
> - Add hash for license file
> - Fix CVE-2013-0348 and CVE-2017-17663
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/thttpd/0001-getline.patch | 26 --------------------------
>  package/thttpd/thttpd.hash        |  6 +++---
>  package/thttpd/thttpd.mk          | 16 ++--------------
>  3 files changed, 5 insertions(+), 43 deletions(-)
>  delete mode 100644 package/thttpd/0001-getline.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
