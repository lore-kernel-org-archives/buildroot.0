From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Nov 2014 11:06:06 +0100
Subject: [Buildroot] [PATCH 4/4] rt-tests: allow building subset of
 tests with non-NPTL toolchains
In-Reply-To: <1415613549-2886-5-git-send-email-abrodkin@synopsys.com>
References: <1415613549-2886-1-git-send-email-abrodkin@synopsys.com>
 <1415613549-2886-5-git-send-email-abrodkin@synopsys.com>
Message-ID: <20141110110606.091946eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 10 Nov 2014 12:59:09 +0300, Alexey Brodkin wrote:

> diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
> index 81e5d06..23cc284 100644
> --- a/package/rt-tests/Config.in
> +++ b/package/rt-tests/Config.in
> @@ -1,7 +1,5 @@
>  config BR2_PACKAGE_RT_TESTS
>  	bool "rt-tests"
> -	# no _tid field in 'struct sigevent'
> -	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL

And it doesn't need thread support at all?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
