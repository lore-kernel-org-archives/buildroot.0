From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 21:22:06 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libffi: fix build failure
 with powerpc7
In-Reply-To: <20191124090305.1015485-1-fontaine.fabrice@gmail.com>
References: <20191124090305.1015485-1-fontaine.fabrice@gmail.com>
Message-ID: <20191223212206.1ecd0182@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 24 Nov 2019 10:03:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/5c9dd8fb3b6a128882b6250f197c80232d8a3b53
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...pc.h-fix-build-failure-with-powerpc7.patch | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/libffi/0004-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
