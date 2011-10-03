From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 3 Oct 2011 09:07:24 +0200
Subject: [Buildroot] [RFC] Request for comments on branch
	for-2011.11/host-tools
In-Reply-To: <cover.1317481137.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317481137.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LV_-tuVzOc=dTGqFvtTctiexC_Ge-syha94g2FTMH3YRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Oct 1, 2011 at 5:00 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Here is a small set of patches implementing the recent discussion we
> had about exposing host utilities. It exposes host-uboot-tools and
> host-openocd into a new "Host utilities" main menu.
>
> This is just to see if this looks like something that matches what we
> discussed, and something that Peter would accept.
>
> Regards,
>
> Thomas
>
> The following changes since commit 8511728696a298ccdb8b902b60ab398d8f67e745:
>
> ?gnutls: bump to version 2.10.5 (2011-09-30 08:26:08 +0200)
>
> are available in the git repository at:
> ?http://free-electrons.com/~thomas/buildroot.git for-2011.11/host-tools
>
> Thomas Petazzoni (6):
> ? ? ?Add basic config infrastructure for host utilities
> ? ? ?uboot-tools: expose host package in menuconfig
> ? ? ?libftdi: add host variant
> ? ? ?libusb-compat: add host variant
> ? ? ?libusb: add host variant
> ? ? ?openocd: add as host utility
>
> ?Config.in ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?| ? ?2 ++
> ?package/Config.in.host ? ? ? ? ? ? ? ? | ? ?6 ++++++
> ?package/libftdi/libftdi.mk ? ? ? ? ? ? | ? ?3 +++
> ?package/libusb-compat/libusb-compat.mk | ? ?4 ++++
> ?package/libusb/libusb.mk ? ? ? ? ? ? ? | ? ?3 +++
> ?package/openocd/Config.in.host ? ? ? ? | ? ?6 ++++++
> ?package/openocd/openocd.mk ? ? ? ? ? ? | ? 10 ++++++++++
> ?package/uboot-tools/Config.in.host ? ? | ? ?6 ++++++
> ?8 files changed, 40 insertions(+), 0 deletions(-)
> ?create mode 100644 package/Config.in.host
> ?create mode 100644 package/openocd/Config.in.host
> ?create mode 100644 package/uboot-tools/Config.in.host

No comments on these patches, I support them fully. Good work!

Best regards,
Thomas
