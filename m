From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 20:32:23 +0200
Subject: [Buildroot] [PATCH] enlightment: xtensa workaround no longer
 required
In-Reply-To: <20150626184150.GA26274@waldemar-brodkorb.de>
References: <20150626184150.GA26274@waldemar-brodkorb.de>
Message-ID: <20150710203223.517606d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Fri, 26 Jun 2015 20:41:50 +0200, Waldemar Brodkorb wrote:
> With the update to uClibc-ng 1.0.3, this is no longer needed,
> as the problem is fixed upstream.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/enlightenment/enlightenment.mk |    5 -----
>  1 file changed, 5 deletions(-)

Since my comment, all Buildroot external toolchains have been rebuilt,
so: applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
