From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 16:03:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/efivar: bump version to 37
In-Reply-To: <20190623024614.53491-1-james.hilliard1@gmail.com>
References: <20190623024614.53491-1-james.hilliard1@gmail.com>
Message-ID: <20190623160315.3d10e4df@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 Jun 2019 20:46:14 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Backport patches required to build with gcc-9.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../efivar/0001-Allow-build-with-uClibc.patch |  11 +-
>  ..._guid-handle-misaligned-guid-pointer.patch |  62 +++++++
>  ...es-Werror-address-of-packed-member-c.patch | 174 ++++++++++++++++++
>  ...r-of-Werror-address-of-packed-member.patch |  57 ++++++
>  package/efivar/efivar.hash                    |   2 +-
>  package/efivar/efivar.mk                      |   2 +-
>  6 files changed, 300 insertions(+), 8 deletions(-)
>  create mode 100644 package/efivar/0002-dp.h-make-format_guid-handle-misaligned-guid-pointer.patch
>  create mode 100644 package/efivar/0003-Fix-all-the-places-Werror-address-of-packed-member-c.patch
>  create mode 100644 package/efivar/0004-Fix-another-error-of-Werror-address-of-packed-member.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
