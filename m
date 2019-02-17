From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Feb 2019 15:54:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/safeclib: fix build with gcc 7
In-Reply-To: <20190217100117.23098-1-fontaine.fabrice@gmail.com>
References: <20190217100117.23098-1-fontaine.fabrice@gmail.com>
Message-ID: <20190217155407.6bce42c1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Feb 2019 11:01:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/f4fe6bf54d213ca75bc1f16df61f8f92e648288e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-pic_flag-to-RETPOLINE-cflags-and-ldflags.patch | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 package/safeclib/0002-add-pic_flag-to-RETPOLINE-cflags-and-ldflags.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
