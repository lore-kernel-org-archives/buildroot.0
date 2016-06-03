From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 09:49:52 +0200
Subject: [Buildroot] [PATCH] mongrel2: allow to build for sparc
In-Reply-To: <20160603031720.GA28367@waldemar-brodkorb.de>
References: <20160603031720.GA28367@waldemar-brodkorb.de>
Message-ID: <20160603094952.227a7f1b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Jun 2016 05:17:20 +0200, Waldemar Brodkorb wrote:
> With uClibc-ng 1.0.15 sparc support got context functions.
> Tested with qemu-system-sparc.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/mongrel2/Config.in |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks. However, this means I will have to rebuild
the sparc Buildroot external toolchain, because I've just rebuilt it
with Buildroot 2016.05, but Buildroot 2016.05 doesn't have uClibc-ng
1.0.15.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
