From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 20:03:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/qemu: fix qemu 3.1.1.1 to build
 with >glib-2.29
In-Reply-To: <20191025104257.3178713-1-pmatos@igalia.com>
References: <20191025104257.3178713-1-pmatos@igalia.com>
Message-ID: <20191025200350.7ef6cf58@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Oct 2019 12:42:57 +0200
Paulo Matos <pmatos@igalia.com> wrote:

> These patches are already in qemu upstream under:
> - 184943d827ce09375284e6fbb9fd5eeb9e369529
> - 71ba74f67eaca21b0cc9d96f534ad3b9a7161400
> 
> They rename gettid() to sys_gettid() to avoid clash with glibc
> 
> Signed-off-by: Paulo Matos <pmatos@igalia.com>
> ---
>  ...ser-assume-__NR_gettid-always-exists.patch | 44 +++++++++
>  ...e-gettid-to-sys_gettid-to-avoid-clas.patch | 91 +++++++++++++++++++
>  2 files changed, 135 insertions(+)
>  create mode 100644 package/qemu/3.1.1.1/0004-linux-user-assume-__NR_gettid-always-exists.patch
>  create mode 100644 package/qemu/3.1.1.1/0005-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
