From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 14:34:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/hiredis: fix build with gcc 4.8
In-Reply-To: <20200905215222.2066726-1-fontaine.fabrice@gmail.com>
References: <20200905215222.2066726-1-fontaine.fabrice@gmail.com>
Message-ID: <20200906143440.6e1074df@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Sep 2020 23:52:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This patch is needed to fix a build failure with hiredis 1.0.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f7aa90d6d6750fb8bf46334513df09360a8c1c7f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0003-Explicitly-set-c99-in-CMake.patch    | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/hiredis/0003-Explicitly-set-c99-in-CMake.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
