From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:48:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/mmc-utils: fix build with gcc
 4.9
In-Reply-To: <20190928185325.21443-1-fontaine.fabrice@gmail.com>
References: <20190928185325.21443-1-fontaine.fabrice@gmail.com>
Message-ID: <20190928214817.2275ff3c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 20:53:25 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/bf3b6f9f6ef39b99842b3c92495b7bf359c68158
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-mmc_cmds.c-fix-build-with-gcc-4.9.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/mmc-utils/0001-mmc_cmds.c-fix-build-with-gcc-4.9.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
