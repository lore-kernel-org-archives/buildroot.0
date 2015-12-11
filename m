From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Dec 2015 21:38:39 +0100
Subject: [Buildroot] [PATCHv2 1/3] ltp-testsuite: disable tirpc tests
 using authdes_create
In-Reply-To: <1449823902-3309-1-git-send-email-patrickdepinguin@gmail.com>
References: <1449823902-3309-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20151211213839.4633d0d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 11 Dec 2015 09:51:40 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> In buildroot, libtirpc is patched to remove authdes_create functions.
> As a result, compilation of tests that use these functions, fails.
> 
> A previous fix was implemented in commit
> 8f1c4c49a2ab0fc9e6cf73370f4483e253e5ac2d, but simply disabled linking with
> libtirpc entirely. This broke usage of ltp-testsuite on targets where the
> toolchain does not have RPC support and libtirpc is mandatory.
> 
> Instead, disable only the problematic tests, leaving ltp-testsuite usable
> with libtirpc.
> 
> Cc: Baruch Siach <baruch@tkos.co.il>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  ...isable-tirpc_auth_authdes_seccreate-tests.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/ltp-testsuite/0002-rpc-tirpc-disable-tirpc_auth_authdes_seccreate-tests.patch

All three patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
