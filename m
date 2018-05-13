From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 23:01:20 +0200
Subject: [Buildroot] [PATCH 1/1] cifs-utils: bump to version 6.8
In-Reply-To: <20180508161537.13609-1-fontaine.fabrice@gmail.com>
References: <20180508161537.13609-1-fontaine.fabrice@gmail.com>
Message-ID: <20180513230120.7f9673e4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 May 2018 18:15:37 +0200, Fabrice Fontaine wrote:
> - Remove patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-mount.cifs-Remove-data_blob.h-include.patch | 32 ----------------------
>  package/cifs-utils/cifs-utils.hash                 |  5 +++-
>  package/cifs-utils/cifs-utils.mk                   |  2 +-
>  3 files changed, 5 insertions(+), 34 deletions(-)
>  delete mode 100644 package/cifs-utils/0001-mount.cifs-Remove-data_blob.h-include.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
