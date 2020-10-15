From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 22:56:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/apparmor: fix build on uclibc
In-Reply-To: <20201015164604.963072-1-fontaine.fabrice@gmail.com>
References: <20201015164604.963072-1-fontaine.fabrice@gmail.com>
Message-ID: <20201015225657.03399085@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Oct 2020 18:46:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build of version 3.0.0 with uclibc
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/aea20bd5539fad35385565ffeb7e6ac566507017
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...orce-host-cpp-to-detect-reallocarray.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/apparmor/0001-parser-Makefile-dont-force-host-cpp-to-detect-reallocarray.patch

Applied to master, but after moving the patch to package/libapparmor/,
renumbering it 0002. It also gets applied to apparmor due to the
symlink package/apparmor/3.0.0 -> package/libapparmor/3.0.0 that I
created.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
