From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 19:48:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvmtools: add resolutionkms
 option
In-Reply-To: <20190216182048.12331-1-fontaine.fabrice@gmail.com>
References: <20190216182048.12331-1-fontaine.fabrice@gmail.com>
Message-ID: <20190327194805.1e17a4e3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 Feb 2019 19:20:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> resolutionkms has been added in version 10.2.5 and
> https://github.com/vmware/open-vm-tools/commit/dc95efcb7d4bb7d865b7d37f9aaafe6fb8009e59
> 
> It depends on udev and libdrm's vmwgfx option
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/92f7c88917066b1d3e15ee0d1baafe01c0cb29c8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openvmtools/Config.in      | 11 +++++++++++
>  package/openvmtools/openvmtools.mk |  7 +++++++
>  2 files changed, 18 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
