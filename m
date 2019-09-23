From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 23:23:41 +0200
Subject: [Buildroot] [for-next 1/3] package/efl: bump to version 1.22.3
In-Reply-To: <20190831100508.8113-1-romain.naour@gmail.com>
References: <20190831100508.8113-1-romain.naour@gmail.com>
Message-ID: <20190923232341.4d7e98d8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 31 Aug 2019 12:05:06 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Remove upstream patch and rename the remaining patch.
> 
> This version is needed for enlightenment 0.23.0.
> 
> See:
> https://www.enlightenment.org/news/efl-1.22.3
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...INA_VALUE_EMPTY-during-library-init.patch} |  0
>  ...missing-__has_attribute-definitions-.patch | 48 -------------------
>  package/efl/efl.hash                          |  4 +-
>  package/efl/efl.mk                            |  2 +-
>  4 files changed, 3 insertions(+), 51 deletions(-)
>  rename package/efl/{0002-eina-set-EINA_VALUE_EMPTY-during-library-init.patch => 0001-eina-set-EINA_VALUE_EMPTY-during-library-init.patch} (100%)
>  delete mode 100644 package/efl/0001-libunibreak-add-missing-__has_attribute-definitions-.patch

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
