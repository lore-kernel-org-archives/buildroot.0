From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 11:56:05 +0200
Subject: [Buildroot] [PATCH 1/2] uclibc: update uClibc-ng to latest
 version
In-Reply-To: <20150715065205.GA21711@waldemar-brodkorb.de>
References: <20150715065205.GA21711@waldemar-brodkorb.de>
Message-ID: <20150715115605.3d1e620b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Wed, 15 Jul 2015 08:52:05 +0200, Waldemar Brodkorb wrote:
> Fixes gcc 5.1 errors and contains all recent
> improvements to Xtensa/ARC NPTL/TLS.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/Config.in   |    2 +-
>  package/uclibc/uclibc.hash |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both patches applied, thanks! Note however that we usually combine the
bump with the handling of the patches, especially since in general some
of the patches are kept accross the bump and adapted accordingly.

In this specific case though it works fine since all 1.0.3 patches have
been merged, so the 1.0.4 bump can work on its own, and the 1.0.3
patches removed afterwards.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
