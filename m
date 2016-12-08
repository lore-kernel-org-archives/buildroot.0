From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Dec 2016 22:30:56 +0100
Subject: [Buildroot] [PATCH] uclibc-ng-test: disable some parts of
 test-suite
In-Reply-To: <20161208023417.GA5366@waldemar-brodkorb.de>
References: <20161208023417.GA5366@waldemar-brodkorb.de>
Message-ID: <20161208223056.2c40f40e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Dec 2016 03:34:17 +0100, Waldemar Brodkorb wrote:
> The math tests are experimental at the moment and require more
> adaptions before they can be enabled again.
> The locale tests are not compatible with musl toolchains,
> so disable them.
> 
> Use latest git version from upstream for other bugfixes.
> 
> Fixes:
>  http://autobuild.buildroot.net/results/74e/74e7add310797772bc51f9ea9847408a8b05d643/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc-ng-test/uclibc-ng-test.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
