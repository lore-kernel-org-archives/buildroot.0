From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 22:21:44 +0100
Subject: [Buildroot] [PATCH] libxml2: add several security patches
In-Reply-To: <1447801725-15810-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447801725-15810-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151118222144.5e7740e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 17 Nov 2015 20:08:45 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-1819 - The xmlreader in libxml allows remote attackers to cause
> a denial of service (memory consumption) via crafted XML data, related
> to an XML Entity Expansion (XEE) attack.
> CVE-2015-7941 - out-of-bounds memory access.
> CVE-2015-7942 - heap-buffer-overflow in xmlParseConditionalSections.
> CVE-2015-8035 - DoS via crafted xz file.
> 
> All patches upstream.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libxml2/0003-fix-CVE-2015-1819.patch   | 178 +++++++++++++++++++++++++
>  package/libxml2/0004-fix-CVE-2015-7941-1.patch |  34 +++++
>  package/libxml2/0005-fix-CVE-2015-7941-2.patch |  51 +++++++
>  package/libxml2/0006-fix-CVE-2015-7942-1.patch |  34 +++++
>  package/libxml2/0007-fix-CVE-2015-7942-2.patch |  30 +++++
>  package/libxml2/0008-fix-CVE-2015-8035.patch   |  33 +++++
>  6 files changed, 360 insertions(+)
>  create mode 100644 package/libxml2/0003-fix-CVE-2015-1819.patch
>  create mode 100644 package/libxml2/0004-fix-CVE-2015-7941-1.patch
>  create mode 100644 package/libxml2/0005-fix-CVE-2015-7941-2.patch
>  create mode 100644 package/libxml2/0006-fix-CVE-2015-7942-1.patch
>  create mode 100644 package/libxml2/0007-fix-CVE-2015-7942-2.patch
>  create mode 100644 package/libxml2/0008-fix-CVE-2015-8035.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
