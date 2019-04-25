From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Apr 2019 21:53:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpm: fix build with NLS
In-Reply-To: <20190425165319.24567-1-fontaine.fabrice@gmail.com>
References: <20190425165319.24567-1-fontaine.fabrice@gmail.com>
Message-ID: <20190425215308.5c93632e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Apr 2019 18:53:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/26e20e19d878811d90fce52eb0951ee4d8b59068
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ile.am-rpm2-cpio-archive-needs-lintl.patch | 51 +++++++++++++++++++
>  package/rpm/rpm.mk                            |  2 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 package/rpm/0003-Makefile.am-rpm2-cpio-archive-needs-lintl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
