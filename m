From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 12:55:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvncserver: fix build without
 C++
In-Reply-To: <20190623082551.1679-1-fontaine.fabrice@gmail.com>
References: <20190623082551.1679-1-fontaine.fabrice@gmail.com>
Message-ID: <20190623125553.60a13ea0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Jun 2019 10:25:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/16aaa4e86a2dbf1acf95f10d5131b0f7b8a3d61a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...1-CMakeLists.txt-fix-build-without-C.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/libvncserver/0001-CMakeLists.txt-fix-build-without-C.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
