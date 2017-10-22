From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 14:05:14 +0200
Subject: [Buildroot] [PATCH] openssl: unconditionally define
 BR2_PACKAGE_PROVIDES_HOST_OPENSSL
In-Reply-To: <20171022115601.9220-1-peter@korsgaard.com>
References: <20171022115601.9220-1-peter@korsgaard.com>
Message-ID: <20171022140514.2161ed40@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Oct 2017 13:56:01 +0200, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/207/207d0ca1fe5328e675246c851fcb0d5685f8c0bd/
> http://autobuild.buildroot.net/results/546/546a56d6dd39e5e9ecfe25fd36a00510e6c0c45b/
> 
> host-openssl may be used without openssl being enabled for the target, so
> move BR2_PACKAGE_PROVIDES_HOST_OPENSSL outside the BR2_PACKAGE_OPENSSL
> conditional.
> 
> While we're at it, add a comment explaining what this magic config symbol does.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/openssl/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
