From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 17:12:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/qlibc: bump to version 2.4.4
In-Reply-To: <20190328192227.20045-1-fontaine.fabrice@gmail.com>
References: <20190328192227.20045-1-fontaine.fabrice@gmail.com>
Message-ID: <20190329171252.3db12d5a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 Mar 2019 20:22:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patches (already in version) and autoreconf
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../qlibc/0001-remove-absolute-paths.patch    |  19 ---
>  package/qlibc/0002-obey-destdir.patch         | 144 ------------------
>  .../qlibc/0003-fix-openssl-mysql-checks.patch |  36 -----
>  package/qlibc/qlibc.hash                      |   3 +-
>  package/qlibc/qlibc.mk                        |   4 +-
>  5 files changed, 3 insertions(+), 203 deletions(-)
>  delete mode 100644 package/qlibc/0001-remove-absolute-paths.patch
>  delete mode 100644 package/qlibc/0002-obey-destdir.patch
>  delete mode 100644 package/qlibc/0003-fix-openssl-mysql-checks.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
