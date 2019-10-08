From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 23:11:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenh264: fix build without
 ssp
In-Reply-To: <20191008183216.18578-1-fontaine.fabrice@gmail.com>
References: <20191008183216.18578-1-fontaine.fabrice@gmail.com>
Message-ID: <20191008231116.03c1c2f6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Oct 2019 20:32:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/377818cf8c1f2632cabdccb32bf4e7f06c0fdbbd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Add-USE_STACK_PROTECTOR-option.patch | 100 ++++++++++++++++++
>  package/libopenh264/libopenh264.mk            |   3 +-
>  2 files changed, 102 insertions(+), 1 deletion(-)
>  create mode 100644 package/libopenh264/0001-Add-USE_STACK_PROTECTOR-option.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
