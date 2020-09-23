From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 20:48:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/open-plc-utils: fix build with
 gcc 10
In-Reply-To: <20200923171601.353451-1-fontaine.fabrice@gmail.com>
References: <20200923171601.353451-1-fontaine.fabrice@gmail.com>
Message-ID: <20200923204814.2b529ad4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Sep 2020 19:16:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/6b3064b64dea3d4aaf219f787429c25918101483
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0002-plc-plc.h-fix-build-with-gcc-10.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/open-plc-utils/0002-plc-plc.h-fix-build-with-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
