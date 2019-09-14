From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Sep 2019 15:43:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/zziplib: fixup the 'v' prefix
 in the version
In-Reply-To: <20190911170633.27679-1-fontaine.fabrice@gmail.com>
References: <20190911170633.27679-1-fontaine.fabrice@gmail.com>
Message-ID: <20190914154323.3bed0df8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 11 Sep 2019 19:06:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> In order for the zziplib version to match what is given by
> release-monitoring.org, the 'v' prefix should be encoded in
> ZZIPLIB_SITE and not ZZIPLIB_VERSION.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zziplib/zziplib.hash | 2 +-
>  package/zziplib/zziplib.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
