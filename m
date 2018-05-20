From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 18:43:31 +0200
Subject: [Buildroot] [PATCH 1/1] libpam-tacplus: bump to version
 1.5.0-beta.2
In-Reply-To: <20180520143326.13993-1-fontaine.fabrice@gmail.com>
References: <20180520143326.13993-1-fontaine.fabrice@gmail.com>
Message-ID: <20180520184331.6dea293a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 May 2018 16:33:26 +0200, Fabrice Fontaine wrote:
> - Remove LIBPAM_TACPLUS_AUTORECONF_OPTS as m4 directory doesn't exist
>   anymore
> - Add patch to fix getrandom call (sent upstream)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Fix-getrandom-call-in-magic.c.patch       | 30 ++++++++++++++++++++++
>  package/libpam-tacplus/libpam-tacplus.hash         |  3 ++-
>  package/libpam-tacplus/libpam-tacplus.mk           |  3 +--
>  3 files changed, 33 insertions(+), 3 deletions(-)
>  create mode 100644 package/libpam-tacplus/0001-Fix-getrandom-call-in-magic.c.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
