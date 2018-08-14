From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 15:57:02 +0200
Subject: [Buildroot] [PATCH v1 1/1] tini: new package
In-Reply-To: <20180810184255.17612-1-christian@paral.in>
References: <20180810184255.17612-1-christian@paral.in>
Message-ID: <20180814155702.7672ca9a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Aug 2018 11:42:55 -0700, Christian Stewart wrote:
> Tini is a minimal init process to act as PID 1 for containers.
> 
> Note: it is not necessary to compile Tini statically for many non-docker
> container environments, and Docker now statically links to Tini internally (as
> of 1.13).
> 
> Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in      |  1 +
>  package/tini/Config.in | 16 ++++++++++++++++
>  package/tini/tini.hash |  3 +++
>  package/tini/tini.mk   | 37 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 57 insertions(+)
>  create mode 100644 package/tini/Config.in
>  create mode 100644 package/tini/tini.hash
>  create mode 100644 package/tini/tini.mk

The entry to the DEVELOPERS file was missing, so I've added it, and
applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
