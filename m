From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 22:06:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/motion: bump to version 4.3.1
In-Reply-To: <20201004210807.2084836-1-fontaine.fabrice@gmail.com>
References: <20201004210807.2084836-1-fontaine.fabrice@gmail.com>
Message-ID: <20201008220616.4d9604d0@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Oct 2020 23:08:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Call gettextsize and add a non upstreamable patch to remove
>   po/Makefile.in: https://github.com/Motion-Project/motion/issues/1028
> - --with-mysql-{include,lib} and --with-pgsql-{include,lib} have been
>   dropped since version 4.3.0 and
>   https://github.com/Motion-Project/motion/commit/0dc2ae9372cfd2705110ef25c8c85b246adb2dc6
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../motion/0001-Fix-build-with-GCC-10.patch   | 53 -------------------
>  ...1-configure.ac-remove-po-Makefile.in.patch | 29 ++++++++++
>  package/motion/motion.hash                    |  4 +-
>  package/motion/motion.mk                      | 19 +++----
>  4 files changed, 38 insertions(+), 67 deletions(-)
>  delete mode 100644 package/motion/0001-Fix-build-with-GCC-10.patch
>  create mode 100644 package/motion/0001-configure.ac-remove-po-Makefile.in.patch

Thanks. I really find the whole gettext story a bit horrible, but well,
applied to master anyway. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
