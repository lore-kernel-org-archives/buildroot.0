From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Feb 2019 21:20:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix build with older
 kernels
In-Reply-To: <20190216100951.10872-1-fontaine.fabrice@gmail.com>
References: <20190216100951.10872-1-fontaine.fabrice@gmail.com>
Message-ID: <20190224212003.7ae5b7ec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Feb 2019 11:09:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> These 4 patches have been sent upstream and merged in version 241:
> https://github.com/systemd/systemd/pull/11641
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/970b09e1d49b53dff12a07ca4ad424ef9dd29a69
>  - http://autobuild.buildroot.org/results/0a671b08d5e74ff0b04024e729c498c4444e3e92
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...vlan.c-fix-build-without-BRIDGE_VLAN_INFO.patch | 34 ++++++++++++++++++++++
>  ...isc.c-fix-build-without-IFA_F_NOPREFIXROU.patch | 33 +++++++++++++++++++++
>  ...dress.c-fix-build-without-IFA_F_NOPREFIXR.patch | 33 +++++++++++++++++++++
>  ...cp6.c-fix-build-without-IFA_F_NOPREFIXROU.patch | 33 +++++++++++++++++++++
>  4 files changed, 133 insertions(+)
>  create mode 100644 package/systemd/0014-networkd-brvlan.c-fix-build-without-BRIDGE_VLAN_INFO.patch
>  create mode 100644 package/systemd/0015-networkd-ndisc.c-fix-build-without-IFA_F_NOPREFIXROU.patch
>  create mode 100644 package/systemd/0016-networkd-address.c-fix-build-without-IFA_F_NOPREFIXR.patch
>  create mode 100644 package/systemd/0017-networkd-dhcp6.c-fix-build-without-IFA_F_NOPREFIXROU.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
