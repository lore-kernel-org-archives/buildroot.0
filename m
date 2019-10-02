From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:14:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/fastd: select
 BR2_PACKAGE_LIBSODIUM_FULL
In-Reply-To: <20191001165807.12479-1-fontaine.fabrice@gmail.com>
References: <20191001165807.12479-1-fontaine.fabrice@gmail.com>
Message-ID: <20191002211423.4bf905d2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  1 Oct 2019 18:58:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit ad7963ea90ce1d762e2b3d8a0c76b4d0bc1fa805 added an option to
> disable some libsodium functions so select it as it's needed by fastd
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/dba0e1b9df3e02fbd2261086189d2b6c483ce664
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fastd/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
