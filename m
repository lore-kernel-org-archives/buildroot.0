From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 22:22:08 +0200
Subject: [Buildroot] [PATCH 1/1] nginx: Bump to version 1.15.0
In-Reply-To: <20180627135146.11364-1-ignacy.gawedzki@green-communications.fr>
References: <20180627135146.11364-1-ignacy.gawedzki@green-communications.fr>
Message-ID: <20180630222208.20b7744e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Jun 2018 15:51:46 +0200, Ignacy Gaw?dzki wrote:
> Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> ---
>  ...-rework-autotest-to-be-cross-compila.patch |   6 +-
>  ...-mechanism-allowing-to-force-feature.patch |   8 +-
>  ...ture_run_force_result-for-each-featu.patch |  56 ++--
>  ...auto-lib-libxslt-conf-use-pkg-config.patch |  10 +-
>  ...ake-sys_nerr-guessing-cross-friendly.patch |  16 +-
>  ...auto-lib-openssl-conf-use-pkg-config.patch | 249 ++++++++++++++++--
>  ...7-auto-lib-libgd-conf-use-pkg-config.patch |   6 +-
>  ...linux_config.h-only-include-dlfcn.h-.patch |   6 +-
>  ...x-PCRE-condition-WRT-the-http-and-ht.patch |  33 ---
>  package/nginx/nginx.hash                      |   4 +-
>  package/nginx/nginx.mk                        |   2 +-
>  11 files changed, 291 insertions(+), 105 deletions(-)
>  delete mode 100644 package/nginx/0009-auto-lib-conf-fix-PCRE-condition-WRT-the-http-and-ht.patch

I've applied, after removing the unneeded patch updates, and extending
the commit log with more details (which patches are updated, which
patches are removed and why, why the license file hash is changed).

If you're using nginx, it would be nice if you could try to get more
of our patches upstream :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
