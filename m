From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 09:07:51 +0200
Subject: [Buildroot] [PATCH] uclibc: add ldd compile fix from upstream
In-Reply-To: <20160706054317.GA24041@waldemar-brodkorb.de>
References: <20160706054317.GA24041@waldemar-brodkorb.de>
Message-ID: <20160706090751.6d166fde@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Jul 2016 07:43:17 +0200, Waldemar Brodkorb wrote:
> Fixes a build error, when uclibc utils is selected targeting Blackfin.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/0001-bfin-allow-to-build-ldd.patch | 29 +++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/uclibc/0001-bfin-allow-to-build-ldd.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
