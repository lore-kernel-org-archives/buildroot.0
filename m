From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 20:03:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpciaccess: add Libs.Private
 to pciaccess.pc
In-Reply-To: <20191025171003.4322-1-fontaine.fabrice@gmail.com>
References: <20191025171003.4322-1-fontaine.fabrice@gmail.com>
Message-ID: <20191025200337.32349267@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Oct 2019 19:10:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This will fix a static build failure for hwloc
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f100191acef41d42582ab2a35e1b6f264594f074
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-pciaccess.pc.in-add-Libs.Private.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/libpciaccess/0001-pciaccess.pc.in-add-Libs.Private.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
