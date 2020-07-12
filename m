From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 10:30:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/tinydtls: fix build on big
 endian
In-Reply-To: <20200620202833.1181380-1-fontaine.fabrice@gmail.com>
References: <20200620202833.1181380-1-fontaine.fabrice@gmail.com>
Message-ID: <20200712103043.3475ffae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Jun 2020 22:28:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/e8704e02fdede7b63e22da552292977b23380b32
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-sha2-sha2.c-fix-build-on-big-endian.patch | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch

Applied to master, thanks. While at it, I updated the reference to the
upstream commit, now that it has been merged.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
