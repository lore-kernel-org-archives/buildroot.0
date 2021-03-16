From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:23:30 +0100
Subject: [Buildroot] [PATCH v1] package/cifs-utils: bump version to 6.12
In-Reply-To: <20210315213438.6103-1-ps.report@gmx.net>
References: <20210315213438.6103-1-ps.report@gmx.net>
Message-ID: <20210316212330.0383f444@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Mar 2021 22:34:38 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - removed 0001-Use-DESTDIR-when-installing-mount.smb3-and-optionall.patch
>   (superseded by upstream commit [1])
> 
> - adjust autoreconf comment accordingly
> 
> - add option for smb tools to avoid hard python runtime dependency
>   (smbinfo and smb2-quota are python scripts)
> 
> Changelog ([2]):
> 
>   December, 2020: Release 6.12
>   get/setcifsacl tools are improved to support changing owner, group and SACLs
>   mount.cifs is enhanced to use SUDO_UID env variable for cruid
>   smbinfo is re-written in Python language
>   https://lists.samba.org/archive/samba-technical/2020-December/136156.html
> 
> [1] https://git.samba.org/?p=cifs-utils.git;a=patch;h=a00e84378d9c5e63272ff69ca18fd0e872b384d3
> [2] https://wiki.samba.org/index.php/LinuxCIFS_utils
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...-installing-mount.smb3-and-optionall.patch | 41 -------------------
>  package/cifs-utils/Config.in                  | 11 +++++
>  package/cifs-utils/cifs-utils.hash            |  2 +-
>  package/cifs-utils/cifs-utils.mk              | 12 +++++-
>  4 files changed, 22 insertions(+), 44 deletions(-)
>  delete mode 100644 package/cifs-utils/0001-Use-DESTDIR-when-installing-mount.smb3-and-optionall.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
