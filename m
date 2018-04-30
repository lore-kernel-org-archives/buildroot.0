From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Apr 2018 17:42:15 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] libebml: fix build on some toolchains
In-Reply-To: <20180430122322.25218-1-fontaine.fabrice@gmail.com>
References: <20180430122322.25218-1-fontaine.fabrice@gmail.com>
Message-ID: <20180430174215.615230a5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Apr 2018 14:23:22 +0200, Fabrice Fontaine wrote:
> Replace climits include by limits (retrieve upstream patch from:
> https://github.com/Matroska-Org/libebml/commit/e46906b80e7662fb78d305f576412f9fa4a22218)
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/3c2402a7052acb67fc7e03ad2ff27e84534aaa36
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Update patch with upstream reference and SoB

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
