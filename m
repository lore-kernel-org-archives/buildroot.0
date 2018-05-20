From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 15:50:57 +0200
Subject: [Buildroot] [PATCH 1/1] zmqpp: bump to version 4.2.0
In-Reply-To: <20180520114054.18909-1-fontaine.fabrice@gmail.com>
References: <20180520114054.18909-1-fontaine.fabrice@gmail.com>
Message-ID: <20180520155057.47323455@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 May 2018 13:40:54 +0200, Fabrice Fontaine wrote:
> - Merge both patches in a single one and slighlty update it to keep
>   current behavior (BUILD_STATIC set to yes by default) to be able to
>   send it upstream: https://github.com/zeromq/zmqpp/pull/218. Patch has
>   been merged upstream.
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ow-building-shared-or-static-library-only.patch | 51 +++++++++++++---------
>  ...-Install-static-library-for-static-builds.patch | 33 --------------
>  package/zmqpp/zmqpp.hash                           |  3 +-
>  package/zmqpp/zmqpp.mk                             |  2 +-
>  4 files changed, 33 insertions(+), 56 deletions(-)
>  delete mode 100644 package/zmqpp/0002-Install-static-library-for-static-builds.patch

Applied to next, thanks. Thanks for taking the time to submit the
patches upstream, it is good to see them merged!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
