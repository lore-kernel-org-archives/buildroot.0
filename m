From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 21:53:37 +0100
Subject: [Buildroot] [PATCH/next 1/1] trinity: fix build with kernel
 headers >= 4.19
In-Reply-To: <20181123161449.24504-1-fontaine.fabrice@gmail.com>
References: <20181123161449.24504-1-fontaine.fabrice@gmail.com>
Message-ID: <20181123215337.193b5899@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Nov 2018 17:14:49 +0100, Fabrice Fontaine wrote:
> Retrieve patch from upstream to fix build with kernel headers >= 4.19
> because VIDIOC_RESERVED has been removed since
> https://github.com/torvalds/linux/commit/ea8532daee31bc72abfbc9ca7a43cbec0f6c05af
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ddf6b1cf4e4727928ffba7387953c4cc9719df49
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0004-Check-if-VIDIOC_RESERVED-is-defined.patch | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/trinity/0004-Check-if-VIDIOC_RESERVED-is-defined.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
