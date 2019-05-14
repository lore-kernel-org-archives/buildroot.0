From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 18:25:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/linknx: fix build with log4cpp
In-Reply-To: <20190513204206.3328-1-fontaine.fabrice@gmail.com>
References: <20190513204206.3328-1-fontaine.fabrice@gmail.com>
Message-ID: <20190514182518.51cb4511@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 May 2019 22:42:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/1863f8f27041bc15ca68e786ba3b8e4764c40574
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...Makefile.am-fix-linking-with-log4cpp.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/linknx/0003-src-Makefile.am-fix-linking-with-log4cpp.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
