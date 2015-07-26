From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 21:54:05 +0200
Subject: [Buildroot] [PATCH 1/6] rpcbind: use pkg-config for libtirpc
 flags
In-Reply-To: <1437936318-9450-1-git-send-email-patrickdepinguin@gmail.com>
References: <1437936318-9450-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150726215405.3ce0cec8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 26 Jul 2015 20:45:13 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Instead of hardcoding the flags needed for libtirpc, use pkg-config.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  package/rpcbind/rpcbind.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

All 6 patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
