From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:30:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/davfs2: add optional dependency
 on iconv and NLS
In-Reply-To: <20190420102528.8559-2-fontaine.fabrice@gmail.com>
References: <20190420102528.8559-1-fontaine.fabrice@gmail.com>
 <20190420102528.8559-2-fontaine.fabrice@gmail.com>
Message-ID: <20190422223038.7a372bc0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Apr 2019 12:25:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/ac2c39a7300fbdd069ac5504148ccb2b065fbf8e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/davfs2/0002-fix-iconv.patch | 48 +++++++++++++++++++++++++++++
>  package/davfs2/davfs2.mk            |  8 +++--
>  2 files changed, 54 insertions(+), 2 deletions(-)
>  create mode 100644 package/davfs2/0002-fix-iconv.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
