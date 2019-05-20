From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 20:56:37 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/iputils: bump to version
 s20190515
In-Reply-To: <20190519211504.15141-1-petr.vorel@gmail.com>
References: <20190519211504.15141-1-petr.vorel@gmail.com>
Message-ID: <20190520205637.7018d95b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 May 2019 23:15:04 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> This commit also include changes from s20190324.
> 
> Upstream changed build system to Meson, these extra changes
> were required:
> * remove custom commands of previous build system:
> (IPUTILS_INSTALL_TARGET_CMDS, IPUTILS_PERMISSIONS)
> * remove USE_SYSFS=no (support removed from upstream
> * transform options from USE_FOO={yes,no} to -DUSE_FOO={true,false}
> 
> Removed patch included in this release
> 
> Build ninfod if possible (when use any crypto)
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v3->v4:
> * fixed build on systems without Docbook Stylesheets

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
