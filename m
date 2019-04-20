From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 16:15:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/minicom: fix build with lintl
In-Reply-To: <20190420114449.24878-1-fontaine.fabrice@gmail.com>
References: <20190420114449.24878-1-fontaine.fabrice@gmail.com>
Message-ID: <20190420161528.6161352e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Apr 2019 13:44:49 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/e64cdcf648764be53a3e951304bb89dc9410db23
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ile.am-fix-ascii-xfr-link-with-lintl.patch | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/minicom/0002-src-Makefile.am-fix-ascii-xfr-link-with-lintl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
