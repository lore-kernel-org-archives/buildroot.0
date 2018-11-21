From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 20:56:07 +0100
Subject: [Buildroot] [PATCH 1/1] motion: fix static build with webp
In-Reply-To: <20181121190204.21520-1-fontaine.fabrice@gmail.com>
References: <20181121190204.21520-1-fontaine.fabrice@gmail.com>
Message-ID: <20181121205607.17081c81@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Nov 2018 20:02:04 +0100, Fabrice Fontaine wrote:
> Static build with webp fails because webp is put before webpmux
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4d4e72808300ba1ff79ca794930112b554eb2533
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../motion/0001-fix-static-linking-with-webp.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/motion/0001-fix-static-linking-with-webp.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
