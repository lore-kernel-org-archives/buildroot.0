From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Aug 2013 21:28:22 +0200
Subject: [Buildroot] [PATCH 0 of 2] strongswan: fix some autobuild
 failures
In-Reply-To: <patchbomb.1375896855@BEANTN0L019720>
References: <patchbomb.1375896855@BEANTN0L019720>
Message-ID: <20130810212822.669b3db7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 07 Aug 2013 19:34:15 +0200, Thomas De Schampheleire wrote:
> strongswan suffers from several autobuild failures. This series addresses
> one of them: 'no rule to make target libtls.la'. While looking at it, I also
> saw a missing host-pkgconf dependency, although I did not see this in any of
> the autobuilds I checked.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
>  package/strongswan/strongswan-0001-force-tls-when-needed.patch |  72 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  package/strongswan/strongswan.mk                               |   9 +++++++++
>  2 files changed, 81 insertions(+), 0 deletions(-)

Committed both patches, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
