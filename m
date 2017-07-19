From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 21:10:32 +0200
Subject: [Buildroot] [PATCH v2 2/2] iproute2: bump to version 4.12.0
In-Reply-To: <c5102e43fc46433a2e9de6d8c4dea0ba5c370c98.1500489830.git.baruch@tkos.co.il>
References: <7d39adcfed0fa70634aa025114ed8f2d7d9e68b3.1500489830.git.baruch@tkos.co.il>
 <c5102e43fc46433a2e9de6d8c4dea0ba5c370c98.1500489830.git.baruch@tkos.co.il>
Message-ID: <20170719211032.252a0aeb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Jul 2017 21:43:50 +0300, Baruch Siach wrote:
> Drop upstream patch.
> 
> Add uClibc-ng compatibility fix. This is needed due to missing definition in
> netinet/in.h.
> 
> Add license file hash.
> 
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../iproute2/0002-Fix-build-with-uClibc-ng.patch   | 38 ++++++++++++++++++++++
>  .../0002-ip-include-libc-headers-first.patch       | 35 --------------------
>  package/iproute2/iproute2.hash                     |  3 +-
>  package/iproute2/iproute2.mk                       |  2 +-
>  4 files changed, 41 insertions(+), 37 deletions(-)
>  create mode 100644 package/iproute2/0002-Fix-build-with-uClibc-ng.patch
>  delete mode 100644 package/iproute2/0002-ip-include-libc-headers-first.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
