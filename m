From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 14:32:23 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/iputils: fix build with
 nettle
In-Reply-To: <20190521172325.30527-1-fontaine.fabrice@gmail.com>
References: <20190521172325.30527-1-fontaine.fabrice@gmail.com>
Message-ID: <20190526143223.0c825284@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 May 2019 19:23:25 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/e86555090e27b631ba35214ef100aa9331844684
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-ninfod_name.c-fix-build-with-nettle.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/iputils/0001-ninfod-ninfod_name.c-fix-build-with-nettle.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
