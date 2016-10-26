From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 22:05:44 +0200
Subject: [Buildroot] [PATCH 1/2] libpcap: drop libnl headers patch
In-Reply-To: <806b12235b685b37dced54464cbd380abf091c33.1477501390.git.baruch@tkos.co.il>
References: <806b12235b685b37dced54464cbd380abf091c33.1477501390.git.baruch@tkos.co.il>
Message-ID: <20161026220544.3183194e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Oct 2016 20:03:09 +0300, Baruch Siach wrote:
> We can avoid host headers using a --with-libnl parameter to override the
> default host headers path. The configure script adds /include suffix to the
> include path. So we still need to manually add -I with the correct path to
> CFLAGS because libnl headers are under the libnl3/ directory.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../libpcap/0001-remove-libnl-include-path.patch   | 25 ----------------------
>  package/libpcap/libpcap.mk                         |  1 +
>  2 files changed, 1 insertion(+), 25 deletions(-)
>  delete mode 100644 package/libpcap/0001-remove-libnl-include-path.patch

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
