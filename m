From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:41:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/libyuv: bump to version
 413a8d8041f1cc5a350a47c0d81cc721e64f9fd0
In-Reply-To: <20190422204620.5645-1-fontaine.fabrice@gmail.com>
References: <20190422204620.5645-1-fontaine.fabrice@gmail.com>
Message-ID: <20190424224118.0eff4bf1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Apr 2019 22:46:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch to https://chromium.googlesource.com/libyuv/libyuv which is
>   the official repository and still active (updated this month).
>   Current site has not been updated since 2015.
> - Drop second patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libyuv/0002-aarch64.patch | 36 -------------------------------
>  package/libyuv/libyuv.hash        |  3 ++-
>  package/libyuv/libyuv.mk          |  7 ++----
>  3 files changed, 4 insertions(+), 42 deletions(-)
>  delete mode 100644 package/libyuv/0002-aarch64.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
