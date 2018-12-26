From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 22:17:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/libftdi1: fix swig build error
 when using cmake 3.12
In-Reply-To: <20181223195714.17155-1-mark.corbin@embecosm.com>
References: <20181223195714.17155-1-mark.corbin@embecosm.com>
Message-ID: <20181226221745.577c2fa9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Dec 2018 19:57:14 +0000, Mark Corbin wrote:
> The build fails with 'Unable to find' swig.swg and python.swg when
> using cmake version 3.12.
> 
> This commit adds a patch from upstream libftdi.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/cc54fec0cd6e35e99dde2f43e0eb28b9d628cd19
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> ---
>  package/libftdi1/0004-cmake-find-swig.patch | 26 +++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/libftdi1/0004-cmake-find-swig.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
