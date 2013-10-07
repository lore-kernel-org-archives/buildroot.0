From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Oct 2013 19:56:45 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: needs largefile support
In-Reply-To: <20131006184759.B376396CB6@busybox.osuosl.org>
References: <20131006184759.B376396CB6@busybox.osuosl.org>
Message-ID: <20131007195645.5c17a27f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 6 Oct 2013 20:32:32 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=ef5f9b9b9a6353eafae15f7e5e148a1a1cf607a2
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/ltp-testsuite/Config.in |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
> index 3681eaf..a984d7b 100644
> --- a/package/ltp-testsuite/Config.in
> +++ b/package/ltp-testsuite/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
>  	bool "ltp-testsuite"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_INET_IPV6
> +	depends on BR2_LARGEFILE

Did you had a specific build failure in a !largefile case?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
