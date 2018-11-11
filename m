From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 22:10:45 +0100
Subject: [Buildroot] [PATCH 1/1] supertuxkart: fix build on bdver3
In-Reply-To: <20181110142041.17651-1-fontaine.fabrice@gmail.com>
References: <20181110142041.17651-1-fontaine.fabrice@gmail.com>
Message-ID: <20181111221045.12937871@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Nov 2018 15:20:41 +0100, Fabrice Fontaine wrote:
> Retrieve upstream patch to fix build failure in
> lib/graphics_utils/mipmap/cpusimd.h due to direct inclusion of
> intrinsics headers:
> https://github.com/supertuxkart/stk-code/issues/3091
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/52bd5c45b0d04a863a2530d388899b3e46494ee9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/supertuxkart/0001-Fix-3091.patch | 59 ++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/supertuxkart/0001-Fix-3091.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
