From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 14:37:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/easyframes: fix static build
 with pcap
In-Reply-To: <20200905135422.655429-1-fontaine.fabrice@gmail.com>
References: <20200905135422.655429-1-fontaine.fabrice@gmail.com>
Message-ID: <20200906143748.086644eb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Sep 2020 15:54:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - autobuild.buildroot.org/results/99062bfc8c21c32bc835acae675aede7c9cf0c90
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...Lists.txt-fix-static-build-with-pcap.patch | 57 +++++++++++++++++++
>  package/easyframes/easyframes.mk              |  2 +-
>  2 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644 package/easyframes/0001-CMakesLists.txt-fix-static-build-with-pcap.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
