From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 16:10:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/openpowerlink: fixup the 'V'
 prefix in the version
In-Reply-To: <20190911181440.3778-1-fontaine.fabrice@gmail.com>
References: <20190911181440.3778-1-fontaine.fabrice@gmail.com>
Message-ID: <20190915161000.4c8a9141@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 11 Sep 2019 20:14:40 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> In order for the openpowerlink version to match what is given by
> release-monitoring.org, the 'V' prefix should be encoded in
> OPENPOWERLINK_SOURCE and OPENPOWERLINK_SITE and not
> OPENPOWERLINK_VERSION.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openpowerlink/openpowerlink.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
