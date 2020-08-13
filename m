From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 20:42:32 +0200
Subject: [Buildroot] [PATCH] package/libcurl: fix build against gnutls
 with proxy disabled
In-Reply-To: <0d5ec0a6230311820188e71d6a650fd58e74ee11.1595961209.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 28 Jul 2020 21:33:29 +0300")
References: <0d5ec0a6230311820188e71d6a650fd58e74ee11.1595961209.git.baruch@tkos.co.il>
Message-ID: <87a6yy5qw7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add upstream patch (#4) fixing build with gnutls when
 > BR2_PACKAGE_LIBCURL_PROXY_SUPPORT is disabled.

 > Patch #4 depends on #3 to apply so add this one as well.

 > Fixes:
 > http://autobuild.buildroot.net/results/31d7204869ff71319ea055688c919a646bfb200b/
 > http://autobuild.buildroot.net/results/f8d2fb919475cdff4a36ad93071048ee09193b98/
 > http://autobuild.buildroot.net/results/2f07a0ac1240a6040a3509d2ebf06906a31fd172/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
