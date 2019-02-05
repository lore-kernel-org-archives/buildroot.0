From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Feb 2019 09:42:30 +0100
Subject: [Buildroot] [PATCH 1/1] gnu-efi: fix build on armv5
In-Reply-To: <20190120202652.4419-1-fontaine.fabrice@gmail.com>
References: <20190120202652.4419-1-fontaine.fabrice@gmail.com>
Message-ID: <20190205094230.32f69f80@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Jan 2019 21:26:52 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Don't override the user-provided ARCH when cross-compiling otherwise
> ARCH won't be correct for armv5, aarch64 and x86_64
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2dfc0e10da25a8382a43557420d7dc3444c02dbb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ts-don-t-override-ARCH-when-cross-compili.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/gnu-efi/0002-Make.defaults-don-t-override-ARCH-when-cross-compili.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
