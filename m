From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 15:50:48 +0100
Subject: [Buildroot] [PATCH] madplay: workaround not needed anymore
In-Reply-To: <20161211144727.GA28624@waldemar-brodkorb.de>
References: <20161211144727.GA28624@waldemar-brodkorb.de>
Message-ID: <20161211155048.3576b19d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Dec 2016 15:47:27 +0100, Waldemar Brodkorb wrote:
> The patches for uClibc-ng are upstream and added to buildroot.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/madplay/madplay.mk | 8 --------
>  1 file changed, 8 deletions(-)

Thanks. However I'll hold off on applying this one until a new
uClibc-ng version is released, and we have rebuilt the pre-built
toolchains used in the autobuilders with this new uClibc-ng version.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
