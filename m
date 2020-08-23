From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Aug 2020 23:35:23 +0200
Subject: [Buildroot] [PATCH] package/xen: add upstream security fix for
 XSA-327
In-Reply-To: <20200823203236.6175-1-peter@korsgaard.com>
References: <20200823203236.6175-1-peter@korsgaard.com>
Message-ID: <20200823233523.09b4123f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Aug 2020 22:32:36 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issue:
> 
> CVE-2020-15564: Missing alignment check in VCPUOP_register_vcpu_info
> 
> For further details, see the advisory:
> 
> https://xenbits.xenproject.org/xsa/advisory-327.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/xen/xen.hash | 1 +
>  package/xen/xen.mk   | 2 ++
>  2 files changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
