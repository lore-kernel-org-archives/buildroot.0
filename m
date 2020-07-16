From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 17:50:42 +0200
Subject: [Buildroot] [PATCH] package/libcurl: fix no-proxy build with
 bearssl and nss
In-Reply-To: <c4509d9911d8202601895685017a1295768a1871.1594274810.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 9 Jul 2020 09:06:50 +0300")
References: <c4509d9911d8202601895685017a1295768a1871.1594274810.git.baruch@tkos.co.il>
Message-ID: <87v9intq5p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add two patches fixing build against BearSSL and NSS TLS implementations
 > when BR2_PACKAGE_LIBCURL_PROXY_SUPPORT is disabled.

 > Fixes:
 > http://autobuild.buildroot.net/results/4d37d9163bfece536974f15f16b2ebfc5fabc539/
 > http://autobuild.buildroot.net/results/387e8baa13d0f07ed4dfd5b6ee3b933d4843c0e8/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
