From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 22:40:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/xxhash: fix build with power7
In-Reply-To: <20190925165759.6464-1-fontaine.fabrice@gmail.com>
References: <20190925165759.6464-1-fontaine.fabrice@gmail.com>
Message-ID: <20190927224021.0dd60b67@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 Sep 2019 18:57:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/b431b05b9fd9b06da041162bf258189eebd12050
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...SX-POWER8-support-and-disable-POWER7.patch | 233 ++++++++++++++++++
>  1 file changed, 233 insertions(+)
>  create mode 100644 package/xxhash/0001-PPC64-Fix-VSX-POWER8-support-and-disable-POWER7.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
