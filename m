From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 16:25:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/iwd: fix build with uclibc
In-Reply-To: <20200620132305.436931-1-fontaine.fabrice@gmail.com>
References: <20200620132305.436931-1-fontaine.fabrice@gmail.com>
Message-ID: <20200620162514.6f51b0bb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Jun 2020 15:23:05 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/8bbf7e1d0929d0883c0c2445990f62f5a1d54163
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0001-src-p2p.c-fix-build-with-uclibc.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/iwd/0001-src-p2p.c-fix-build-with-uclibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
