From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 21:27:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/easyframes: fix build with musl
 and gcc 4.8
In-Reply-To: <20200907185002.284189-1-fontaine.fabrice@gmail.com>
References: <20200907185002.284189-1-fontaine.fabrice@gmail.com>
Message-ID: <20200907212707.0d7b4743@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  7 Sep 2020 20:50:02 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/32007293e04e6c661108639d1589fe078f254ecd
>  - http://autobuild.buildroot.org/results/1804e8b68f715de1011750cec2ed5d3d3f7964c8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-Fix-different-compiling-issues.patch | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 package/easyframes/0002-Fix-different-compiling-issues.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
