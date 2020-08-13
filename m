From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:20:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/open-lldp: fix build with gcc 10
In-Reply-To: <20200813211001.522492-1-fontaine.fabrice@gmail.com>
References: <20200813211001.522492-1-fontaine.fabrice@gmail.com>
Message-ID: <20200813232020.64ff3862@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Aug 2020 23:10:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/b6aaaa1e72ba9ce0c29730970911431558181c6e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...004-lldp_head-rename-and-make-extern.patch | 500 ++++++++++++++++++
>  ...05-lldp-add-packed-struct-definition.patch |  49 ++
>  .../open-lldp/0006-lldptool-make-extern.patch |  41 ++
>  ...ake-enum-a-type-rather-than-instance.patch |  33 ++
>  ...08-lldp_8021qaz-extern-config-object.patch |  29 +
>  5 files changed, 652 insertions(+)
>  create mode 100644 package/open-lldp/0004-lldp_head-rename-and-make-extern.patch
>  create mode 100644 package/open-lldp/0005-lldp-add-packed-struct-definition.patch
>  create mode 100644 package/open-lldp/0006-lldptool-make-extern.patch
>  create mode 100644 package/open-lldp/0007-ecp22-make-enum-a-type-rather-than-instance.patch
>  create mode 100644 package/open-lldp/0008-lldp_8021qaz-extern-config-object.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
