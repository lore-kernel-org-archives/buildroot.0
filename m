From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 22:28:48 +0200
Subject: [Buildroot] [PATCH] package/dhcp: bump to version 4.4.2
In-Reply-To: <20200425212830.12910-1-ryanbarnett3@gmail.com>
References: <20200425212830.12910-1-ryanbarnett3@gmail.com>
Message-ID: <20200427222848.0d702f3a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Apr 2020 16:28:30 -0500
Ryan Barnett <ryanbarnett3@gmail.com> wrote:

> Removed 0001-*.patch as it is included with the maintenance release.
> The LICENSE file hash changed due to Copyright year updating to
> include 2020.
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> ---
>  ...ibility-headers-updated-util-bind-sh.patch | 87 -------------------
>  package/dhcp/dhcp.hash                        |  6 +-
>  package/dhcp/dhcp.mk                          |  2 +-
>  3 files changed, 4 insertions(+), 91 deletions(-)
>  delete mode 100644 package/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-headers-updated-util-bind-sh.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
