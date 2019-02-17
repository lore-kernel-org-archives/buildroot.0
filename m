From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Feb 2019 15:58:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/xenomai: fix build with gcc 8
In-Reply-To: <20190216214456.4568-1-fontaine.fabrice@gmail.com>
References: <20190216214456.4568-1-fontaine.fabrice@gmail.com>
Message-ID: <20190217155820.75b22b60@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 Feb 2019 22:44:56 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/3a53f54476828ee878602da9adddf1e1e70f7a69
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...erminated-destination-buffer-with-strncpy.patch | 91 ++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 package/xenomai/0001-demos-posix-prevent-unterminated-destination-buffer-with-strncpy.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
