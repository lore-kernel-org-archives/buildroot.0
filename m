From: Thomas Huth <huth@tuxfamily.org>
Date: Thu, 12 Sep 2019 19:36:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/ascii-invaders: fixup the 'v'
 prefix in the version
In-Reply-To: <20190911171729.29200-1-fontaine.fabrice@gmail.com>
References: <20190911171729.29200-1-fontaine.fabrice@gmail.com>
Message-ID: <20190912193611.1b5883f8@thl530.multi.box>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 11 Sep 2019 19:17:29 +0200
schrieb Fabrice Fontaine <fontaine.fabrice@gmail.com>:

> In order for the ascii-invaders version to match what is given by
> release-monitoring.org, the 'v' prefix should be encoded in
> ASCII_INVADERS_SITE and not ASCII_INVADERS_VERSION.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ascii-invaders/ascii-invaders.hash | 2 +-
>  package/ascii-invaders/ascii-invaders.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Acked-by: Thomas Huth <huth@tuxfamily.org>
