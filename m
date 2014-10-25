From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 19:32:55 +0200
Subject: [Buildroot] [PATCH 1/1] Add library libunistring that is used
 for advanced text processing.
In-Reply-To: <1413758213-30044-1-git-send-email-paguilar@paguilar.org>
References: <1413758213-30044-1-git-send-email-paguilar@paguilar.org>
Message-ID: <20141025193255.7ff34971@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pedro Aguilar,

On Mon, 20 Oct 2014 00:36:53 +0200, Pedro Aguilar wrote:
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> ---
>  package/Config.in                    |  1 +
>  package/libunistring/Config.in       | 12 ++++++++++++
>  package/libunistring/libunistring.mk | 14 ++++++++++++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 package/libunistring/Config.in
>  create mode 100644 package/libunistring/libunistring.mk

Thanks, applied, after doing a few modifications:

    [Thomas:
      - adjust the title of the commit
      - remove the thread dependency, by using the --disable-threads
        option when needed
      - remove LIBUNISTRING_SOURCE, since its value was the default
      - use BR2_GNU_MIRROR in LIBUNISTRING_SITE
      - adjust the license, which really is LGPLv3+, not LGPLv2. The
        license file is COPYING.LIB.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
