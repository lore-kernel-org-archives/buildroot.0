From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Sep 2019 13:53:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/ascii-invaders: fixup the 'v'
 prefix in the version
In-Reply-To: <20190911171729.29200-1-fontaine.fabrice@gmail.com>
References: <20190911171729.29200-1-fontaine.fabrice@gmail.com>
Message-ID: <20190912135357.2d870f4f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Wed, 11 Sep 2019 19:17:29 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> In order for the ascii-invaders version to match what is given by
> release-monitoring.org, the 'v' prefix should be encoded in
> ASCII_INVADERS_SITE and not ASCII_INVADERS_VERSION.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ascii-invaders/ascii-invaders.hash | 2 +-
>  package/ascii-invaders/ascii-invaders.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks. I also did a followup commit to drop the
_SOURCE variable, which was not needed, and caused the tarball to be
named just after the version, instead of using the typical
name-version.tar.gz naming.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
