From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:29:09 +0200
Subject: [Buildroot] [PATCH] gauche: fix build with uClibc
In-Reply-To: <d8e42091b4780d235d30a2cc4549278291300af3.1496897487.git.baruch@tkos.co.il>
References: <d8e42091b4780d235d30a2cc4549278291300af3.1496897487.git.baruch@tkos.co.il>
Message-ID: <20170608212909.3010bc77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Jun 2017 07:51:27 +0300, Baruch Siach wrote:
> As gauche bundles bdwgc, it hit the same uclibc build issue fixed in commit
> 9b04ae71c5e4c (package/bdwgc: fix uclibc build after bump to 7.6.0). Apply the
> upstream bdwgc fix for that.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ebc/ebc70579a94d260fecf05fe4150eebcc59d3b5fb/
> http://autobuild.buildroot.net/results/e1b/e1b2ad89787c345cf8817f6d8436ff52a151c5a6/
> http://autobuild.buildroot.net/results/f39/f396b996a59db79f7a0926aec49c488c3a2797a0/
> 
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...-libc-version.h-build-error-uClibc-x86-_6.patch | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/gauche/0003-Fix-missing-libc-version.h-build-error-uClibc-x86-_6.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
