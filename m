From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 16:10:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/luvi: fixup the 'v' prefix in
 the version
In-Reply-To: <20190911181901.5201-1-fontaine.fabrice@gmail.com>
References: <20190911181901.5201-1-fontaine.fabrice@gmail.com>
Message-ID: <20190915161007.03155a61@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 11 Sep 2019 20:19:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> In order for the luvi version to match what is given by
> release-monitoring.org, the 'v' prefix should be encoded in
> LUVI_SOURCE and LUVI_SITE and not LUVI_VERSION.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/luvi/luvi.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
