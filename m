From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:35:03 +0100
Subject: [Buildroot] [PATCH 1/1] stress-ng: fix build without threads
In-Reply-To: <20181204204759.26767-1-fontaine.fabrice@gmail.com>
References: <20181204204759.26767-1-fontaine.fabrice@gmail.com>
Message-ID: <20181206213503.5106077e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Dec 2018 21:47:59 +0100, Fabrice Fontaine wrote:
> semaphore.h is available only if HAVE_LIB_PTHREAD and
> HAVE_SEM_POSIX are defined
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1c95898b2833683a22bbe2ff8471fa08d94210e1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-stress-ng.h-fix-include-on-semaphore.h.patch | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/stress-ng/0001-stress-ng.h-fix-include-on-semaphore.h.patch

Applied to master after updating the patch upstream status (it was
merged), thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
