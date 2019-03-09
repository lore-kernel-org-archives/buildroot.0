From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 15:15:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/xen: fix build with gcc 8.1
In-Reply-To: <20190309081832.10177-1-fontaine.fabrice@gmail.com>
References: <20190309081832.10177-1-fontaine.fabrice@gmail.com>
Message-ID: <20190309151544.05981fa0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 Mar 2019 09:18:32 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/df5abe6ca8b4c8935f3d5c257aef816190771200
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-32-bit-gcc-8-1-non-debug-build-work.patch | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 package/xen/0004-xenpmd-make-32-bit-gcc-8-1-non-debug-build-work.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
