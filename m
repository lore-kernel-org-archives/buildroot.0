From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jul 2020 15:34:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/libftdi1: fix install path with
 FTDIPP
In-Reply-To: <20200717193419.669052-1-fontaine.fabrice@gmail.com>
References: <20200717193419.669052-1-fontaine.fabrice@gmail.com>
Message-ID: <20200718153446.0b382160@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Jul 2020 21:34:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This will fix a build failure with libsigrok and libftdi1 in version
> 1.5.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1427f44e36752c337791597fab47a1889552a2fe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...sts.txt-fix-paths-when-FTDIPP-is-set.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/libftdi1/0002-CMakeLists.txt-fix-paths-when-FTDIPP-is-set.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
