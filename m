From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Jun 2018 20:42:01 +0200
Subject: [Buildroot] [PATCH 1/1] libraw1394: bump to version 2.1.2
In-Reply-To: <20180530202211.25190-1-fontaine.fabrice@gmail.com>
References: <20180530202211.25190-1-fontaine.fabrice@gmail.com>
Message-ID: <20180603204201.31fa0665@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 May 2018 22:22:11 +0200, Fabrice Fontaine wrote:
> - Remove patches (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...build-the-CLOCK_MONOTONIC_RAW-test-condit.patch | 38 ----------------------
>  package/libraw1394/libraw1394.hash                 |  4 +--
>  package/libraw1394/libraw1394.mk                   |  3 +-
>  3 files changed, 3 insertions(+), 42 deletions(-)
>  delete mode 100644 package/libraw1394/0001-testlibraw-build-the-CLOCK_MONOTONIC_RAW-test-condit.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
