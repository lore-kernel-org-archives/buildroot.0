From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 11:32:11 +0100
Subject: [Buildroot] [PATCH] ltp-testsuite: disable tirpc authdes_create
 tests
In-Reply-To: <1453459231-28194-1-git-send-email-patrickdepinguin@gmail.com>
References: <1453459231-28194-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160126113211.6f2525bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 22 Jan 2016 11:40:31 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Commit d1d735a1480f0f37a5996cb57c5a35ca2c3c3d90 disables the tests
>     tirpc_auth_authdes_seccreate
> but not those in
>     tirpc_auth_authdes_create
> while these also fail on targets without native RPC support.
> 
> Update the added patch to exclude those tests too.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3a2/3a2b141d90b28a2954fa0ad3104cba81d648d2a3/
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  ...c-tirpc-disable-tirpc_auth_authdes_seccreate-tests.patch | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
