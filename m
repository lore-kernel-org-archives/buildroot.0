From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Jul 2012 17:47:33 +0200
Subject: [Buildroot] [PATCH 5/5] lua: split and rename patches
In-Reply-To: <1342446352-31231-5-git-send-email-francois.perrad@gadz.org>
References: <1342446352-31231-1-git-send-email-francois.perrad@gadz.org>
 <1342446352-31231-5-git-send-email-francois.perrad@gadz.org>
Message-ID: <20120716174733.01d6d1ff@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 16 Jul 2012 15:45:52 +0200,
Francois Perrad <fperrad@gmail.com> a ?crit :

> ---
>  package/lua/lua-01-root-path.patch            |   17 +++
>  package/lua/lua-02-shared-libs-for-lua.patch  |   44 ++++++++
>  package/lua/lua-03-shared-libs-for-luac.patch |   92 +++++++++++++++
>  package/lua/lua-root-path.patch               |   17 ---
>  package/lua/lua-shared-libs.patch             |  150
> ------------------------- 5 files changed, 153 insertions(+), 167
> deletions(-) create mode 100644 package/lua/lua-01-root-path.patch
>  create mode 100644 package/lua/lua-02-shared-libs-for-lua.patch
>  create mode 100644 package/lua/lua-03-shared-libs-for-luac.patch
>  delete mode 100644 package/lua/lua-root-path.patch
>  delete mode 100644 package/lua/lua-shared-libs.patch

Looks good, but please take this opportunity to add a header to each
patch, with a description + signed-off-by.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
