From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Apr 2016 13:54:37 +0200
Subject: [Buildroot] [PATCH v2] opencv: fix compile issues
References: <20160405111617.GA23318@waldemar-brodkorb.de>
Message-ID: <tc4sucx7uf.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 05 Apr 2016 13:16:17 +0200 schrieb Waldemar Brodkorb:

> The first patch from Debian fixes following autobuild failure:
> http://autobuild.buildroot.net/results/
eda5c6c43da40a342e0f545a348d2f865eb5ccf2/
> 
> Tested with ARM build without a regression.
> 
> The second patch fixes musl arm autobuild failure:
> http://autobuild.buildroot.net/
results/6a397de789c809984b851a304078e26b2ac58974/
> 
> Signed-off-by: Waldemar Brodkorb
> <wbx@openadk.org>
> ---
> v1 -> v2:
>   * Add Signed-Off-By and description to Debian patch, suggested by
>   Arnout * added backport fix for ARM musl from git master

Hi,

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile-tested with sparc64/glibc[1] and musl[2])

[1] http://autobuild.buildroot.net/
results/08d/08d41780f1fff3e8dc99d5170457730d2f6e42a2/
[2] http://autobuild.buildroot.net/
results/85c/85c9135460de78c35e17dbd791d07732d52abb6a/
