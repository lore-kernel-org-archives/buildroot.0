From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 23:15:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/sp-oops-extract: new package
In-Reply-To: <1439932672-2138-1-git-send-email-rdkehn@yahoo.com>
References: <1439932672-2138-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <20150829231512.3f79e840@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Doug Kehn,

On Tue, 18 Aug 2015 16:17:52 -0500, Doug Kehn wrote:
> A tool for extracting OOPS/panic logs from MTD.
> 
> Tested using arm-buildroot-linux-gnueabihf toolchain.
> 
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> ---
>  package/Config.in                                  |  1 +
>  ...the-Makefile-more-cross-compiler-friendly.patch | 22 ++++++++++++++++++
>  package/sp-oops-extract/Config.in                  |  6 +++++
>  package/sp-oops-extract/sp-oops-extract.hash       |  2 ++
>  package/sp-oops-extract/sp-oops-extract.mk         | 27 ++++++++++++++++++++++
>  5 files changed, 58 insertions(+)
>  create mode 100644 package/sp-oops-extract/0001-Make-the-Makefile-more-cross-compiler-friendly.patch
>  create mode 100644 package/sp-oops-extract/Config.in
>  create mode 100644 package/sp-oops-extract/sp-oops-extract.hash
>  create mode 100644 package/sp-oops-extract/sp-oops-extract.mk

Applied to the next branch, with a few changes:

    [Thomas:
     - use sp-oops-extract instead of sp_oops_extract as the Config.in
       prompt and in the .mk file comment
     - remove @ in front of the build and install commands.
     - use $(TARGET_CONFIGURE_OPTS) instead of manually passing CC, AR,
       LD, CFLAGS and LDFLAGS.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
