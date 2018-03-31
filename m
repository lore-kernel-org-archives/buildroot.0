From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 22:58:05 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] meson: fix error when restorecon unavailable
In-Reply-To: <20180313211825.25745-1-fontaine.fabrice@gmail.com>
References: <20180313211825.25745-1-fontaine.fabrice@gmail.com>
Message-ID: <20180331225805.70d6b20e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Mar 2018 22:18:25 +0100, Fabrice Fontaine wrote:
> host-meson is used by some packages such as libmpdclient.
> If selinuxenabled is installed on host but restorecon is unavailable
> (for an "unknwown" reason), install will crash.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/d5dcdfdfab3503fdc387f99e68267972a38c417d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1->v2:
>  - Update patch following upstream review: https://github.com/mesonbuild/meson/pull/3236#pullrequestreview-103570704

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
