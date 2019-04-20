From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 16:04:40 +0200
Subject: [Buildroot] [PATCH 2/2] package/libtorrent-rasterbar: fix build
 with boost 1.70.0
In-Reply-To: <20190418124451.25968-2-fontaine.fabrice@gmail.com>
References: <20190418124451.25968-1-fontaine.fabrice@gmail.com>
 <20190418124451.25968-2-fontaine.fabrice@gmail.com>
Message-ID: <20190420160440.56be637f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 18 Apr 2019 14:44:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/dc21322e101cbd242a22018f4d506b9f2c26dd33
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0003-fix-build-with-boost-1.70.0.patch    | 267 ++++++++++++++++++
>  1 file changed, 267 insertions(+)
>  create mode 100644 package/libtorrent-rasterbar/0003-fix-build-with-boost-1.70.0.patch

Considering the comments you got from upstream, I marked this one as
Changes Requested. Could you resubmit with the version of the fixes
that were merged upstream ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
