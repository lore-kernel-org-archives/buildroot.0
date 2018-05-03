From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 21:52:08 +0200
Subject: [Buildroot] [PATCH 1/1] libfreeimage: fix build with glibc
In-Reply-To: <20180503144942.7117-1-fontaine.fabrice@gmail.com>
References: <20180503144942.7117-1-fontaine.fabrice@gmail.com>
Message-ID: <20180503215208.2c1abb26@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 May 2018 16:49:42 +0200, Fabrice Fontaine wrote:
> Add patch to rename powf64 into powf_64 as powf64 is already defined in
> glibc
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/9b1e6d63db9eae46a92487713b0d72bd039deaba
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0005-Manage-powf64-with-glibc.patch            | 725 +++++++++++++++++++++
>  1 file changed, 725 insertions(+)
>  create mode 100644 package/libfreeimage/0005-Manage-powf64-with-glibc.patch

Applied to master, thanks. Please don't forget to submit the patch
upstream.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
