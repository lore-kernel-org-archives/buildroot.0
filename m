From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Apr 2016 18:31:44 +0200
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.5.0
In-Reply-To: <1460126438-7648-1-git-send-email-gustavo@zacarias.com.ar>
References: <1460126438-7648-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160408183144.7635f054@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Apr 2016 11:40:38 -0300, Gustavo Zacarias wrote:
> Drop 0003-iproute2-fix-building-with-musl.patch since it's upstream.
> Add gentoo patch to allow for non-iptables builds.
> Add new musl build fix.
> Tweak 0001-Avoid-in6_addr-redefinition.patch since the first chunk is no
> longer required.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0001-Avoid-in6_addr-redefinition.patch         | 22 ++--------
>  .../0003-iproute2-fix-building-with-musl.patch     | 33 ---------------
>  ...te2-tc_bpf.c-fix-building-with-musl-libc..patch | 37 +++++++++++++++++
>  package/iproute2/0004-iproute-no-iptables.patch    | 48 ++++++++++++++++++++++
>  package/iproute2/iproute2.hash                     |  2 +-
>  package/iproute2/iproute2.mk                       |  2 +-
>  6 files changed, 90 insertions(+), 54 deletions(-)
>  delete mode 100644 package/iproute2/0003-iproute2-fix-building-with-musl.patch
>  create mode 100644 package/iproute2/0003-iproute2-tc_bpf.c-fix-building-with-musl-libc..patch
>  create mode 100644 package/iproute2/0004-iproute-no-iptables.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
