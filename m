From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 May 2018 09:16:09 +0200
Subject: [Buildroot] [PATCH 1/1] libcue: bump to version 2.2.1
In-Reply-To: <20180502063528.10091-1-fontaine.fabrice@gmail.com>
References: <20180502063528.10091-1-fontaine.fabrice@gmail.com>
Message-ID: <20180502091609.58783f5f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 May 2018 08:35:28 +0200, Fabrice Fontaine wrote:
> - Remove patch (already in version)
> - Include buildroot patch http://patchwork.ozlabs.org/patch/907206
>   currently in new state
> 
> Fixes:
> - http://autobuild.buildroot.net/results/02712e85db8e538045497e9242b476c040198f1d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-libcue-is-only-implemented-in-C.patch     | 34 ----------------------
>  package/libcue/libcue.hash                         |  2 +-
>  package/libcue/libcue.mk                           |  2 +-
>  3 files changed, 2 insertions(+), 36 deletions(-)
>  delete mode 100644 package/libcue/0001-libcue-is-only-implemented-in-C.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
