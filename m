From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:12:24 +0200
Subject: [Buildroot] [PATCH] libtommath: set PREFIX when installing
In-Reply-To: <20170905185219.9953-1-francois.perrad@gadz.org>
References: <20170905185219.9953-1-francois.perrad@gadz.org>
Message-ID: <20170905211224.6e79dc01@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Sep 2017 20:52:19 +0200, Francois Perrad wrote:
> the default value is /usr/local and causes breakage in libtomcrypt & moarvm
> see http://autobuild.buildroot.net/results/a76/a760063f05ae23f79920bc89ffc37e7dcf77aeab/
> see http://autobuild.buildroot.net/results/78c/78c9bc9a21cfce48615b70d80b25dd4847bd803b/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/libtommath/libtommath.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
