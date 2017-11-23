From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 23:03:05 +0100
Subject: [Buildroot] [PATCH v3 1/2] parted: convert patches to git
 formatting
In-Reply-To: <20171106212303.10662-1-arnout@mind.be>
References: <20171106212303.10662-1-arnout@mind.be>
Message-ID: <20171123230305.789b6166@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Nov 2017 22:23:02 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v3: Don't remove Thomas's Sob (Baruch)
> v2: split off git formatting in separate patch.
> ---
>  ...ted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch |  8 ++++----
>  .../0002-configure.ac-uclinux-is-also-linux.patch       |  4 ++--
>  ...0003-Include-fcntl.h-to-get-loff_t-definition.patch} | 17 ++++++++++++++---
>  3 files changed, 20 insertions(+), 9 deletions(-)
>  rename package/parted/{0003-fix-includes-for-musl.patch => 0003-Include-fcntl.h-to-get-loff_t-definition.patch} (41%)

Both patches applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
