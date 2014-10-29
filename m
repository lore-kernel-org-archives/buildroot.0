From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 21:38:05 +0100
Subject: [Buildroot] [PATCH 14/51] libenca: bump version
In-Reply-To: <1414349157-22749-14-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414349157-22749-14-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141029213805.6d2c640e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Oct 2014 19:45:20 +0100, Maxime Hadjinlian wrote:
> Remove all the patches as they were accepted upstream.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  .../libenca-001-fix-installation-error.patch       | 44 ----------------------
>  ...benca-002-remove-prefix-hack-in-configure.patch | 33 ----------------
>  package/libenca/libenca-003-iconv.patch            | 15 --------
>  package/libenca/libenca.mk                         |  2 +-
>  4 files changed, 1 insertion(+), 93 deletions(-)
>  delete mode 100644 package/libenca/libenca-001-fix-installation-error.patch
>  delete mode 100644 package/libenca/libenca-002-remove-prefix-hack-in-configure.patch
>  delete mode 100644 package/libenca/libenca-003-iconv.patch

Applied, thanks, after removing AUTORECONF = YES, as suggested by
Bernd. Thanks Bernd for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
