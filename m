From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 20:44:25 +0200
Subject: [Buildroot] [PATCH] httping: fix math library linking
In-Reply-To: <1406116042-3054-1-git-send-email-yuvaraj.patil@wipro.com>
References: <1406116042-3054-1-git-send-email-yuvaraj.patil@wipro.com>
Message-ID: <20140729204425.1f4dacb9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yuvaraj Patil,

On Wed, 23 Jul 2014 17:17:22 +0530, Yuvaraj Patil wrote:
> Add the math library directive '-lm' to linker options at the end.
> The order of the math library directive '-lm' matters.
> 
> fixes:
> http://autobuild.buildroot.net/results/843/84382290696e72c23995f5ed020ad5c157817012//
> 
> Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
> ---
>  .../httping-2.3.4-fix-math-library-linking.patch   |   25 ++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/httping/httping-2.3.4-fix-math-library-linking.patch
> 
> diff --git a/package/httping/httping-2.3.4-fix-math-library-linking.patch b/package/httping/httping-2.3.4-fix-math-library-linking.patch

The name of the patch is wrong, it does not follow the Buildroot naming
convention for package patches. It should have been
<packagename>-<sequencenumber>-<description>.patch, and therefore not
include the version of the package.

Committed with this fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
