From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Aug 2014 19:52:37 +0200
Subject: [Buildroot] [PATCH] gpsd: bump version to 3.11
In-Reply-To: <1408959623-26890-1-git-send-email-spdawson@gmail.com>
References: <1408959623-26890-1-git-send-email-spdawson@gmail.com>
Message-ID: <20140825195237.7d05c796@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Dawson,

On Mon, 25 Aug 2014 10:40:23 +0100, Simon Dawson wrote:
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  ...d-01-Fix-build-error-when-ntpshm-is-false.patch | 46 ++++++++++++++++++++++
>  .../gpsd/gpsd-02-sconstruct-disable-rpath.patch    | 16 ++++----
>  package/gpsd/gpsd.mk                               |  7 ++--
>  3 files changed, 56 insertions(+), 13 deletions(-)
>  create mode 100644 package/gpsd/gpsd-01-Fix-build-error-when-ntpshm-is-false.patch

Applied to the next branch, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
