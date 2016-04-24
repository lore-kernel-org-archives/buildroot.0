From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 17:21:11 +0200
Subject: [Buildroot] [PATCH] mono: disable for sparc/sparc64
In-Reply-To: <20160424135125.GA8887@waldemar-brodkorb.de>
References: <20160424135125.GA8887@waldemar-brodkorb.de>
Message-ID: <20160424172111.5f3c64da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Apr 2016 15:51:26 +0200, Waldemar Brodkorb wrote:
> It seems mono isn't supported for sparc32, see configure.ac
> for some comments about it. Tried with sparc64, but this
> doesn't compile either.
> So disable for sparc for now.
> 
> Fixes following autobuild issues:
> http://autobuild.buildroot.org/?reason=mono-4.2.2.30
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/mono/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
