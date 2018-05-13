From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 23:00:14 +0200
Subject: [Buildroot] [PATCH 1/2] clamav: reformat patches as
 Git-formatted patches
In-Reply-To: <20180507212031.31337-1-thomas.petazzoni@bootlin.com>
References: <20180507212031.31337-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180513230014.29febbe2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 May 2018 23:20:30 +0200, Thomas Petazzoni wrote:
> ClamAV is using Git upstream
> (https://github.com/Cisco-Talos/clamav-devel), so it makes sense to
> use Git-formatted patches.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...roto.c-fix-build-error-due-to-missing-soc.patch | 34 ++++++++++++++++++++++
>  package/clamav/0001-clamdscan.patch                | 21 -------------
>  ...use-backtrace-if-using-uClibc-without-ba.patch} | 22 ++++++++++----
>  3 files changed, 51 insertions(+), 26 deletions(-)
>  create mode 100644 package/clamav/0001-clamdscan-proto.c-fix-build-error-due-to-missing-soc.patch
>  delete mode 100644 package/clamav/0001-clamdscan.patch
>  rename package/clamav/{0002-backtrace-uClibc.patch => 0002-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch} (53%)

Thanks to Yann's review, both patches have been applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
