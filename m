From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:17:39 +0100
Subject: [Buildroot] [PATCH] php: fix bfin compile issue
In-Reply-To: <20161109070531.GA7310@waldemar-brodkorb.de>
References: <20161109070531.GA7310@waldemar-brodkorb.de>
Message-ID: <20161109221739.6aa0a1ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 9 Nov 2016 08:05:31 +0100, Waldemar Brodkorb wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/8326f24511d3b109d22a76660adc017bbcaca197
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/php/0007-avoid-bfin-gcc-segfault.patch | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 package/php/0007-avoid-bfin-gcc-segfault.patch

I hate this kind of workaround, but OK, I've applied anyway, it's
probably going to take time to have a real fix for this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
