From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 15:33:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/freerdp: fix build without
 xfixes
In-Reply-To: <20190418220236.5821-1-fontaine.fabrice@gmail.com>
References: <20190418220236.5821-1-fontaine.fabrice@gmail.com>
Message-ID: <20190420153328.49b85442@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Apr 2019 00:02:36 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/69245e574787bada718c52c805ec137041dc233d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ..._floatbar.c-fix-build-without-Xfixes.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/freerdp/0001-xf_floatbar.c-fix-build-without-Xfixes.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
