From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 11:26:22 +0200
Subject: [Buildroot] [PATCH v3 1/1] zeromq: bump to version 4.1.2
In-Reply-To: <1438617072-9275-1-git-send-email-yba@tkos.co.il>
References: <1438617072-9275-1-git-send-email-yba@tkos.co.il>
Message-ID: <20150804112622.1f163396@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben-Avraham,

On Mon,  3 Aug 2015 18:51:12 +0300, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> In the upstream git://github.com/zeromq/libzmq.git:
> 
> commit 6fdafc458a776e063511bb83dc7791aabea00b05 obviated the need for
> 0001-tests-disable-test_fork-if-fork-is-not-available.patch .
> 
> commit c8ee16940fff19ae3c12b4596c4bd131b2c71996 obviated the need for
> 0004-allow-without-libsodium.patch .
> 
> Fixed AUTORECONF comment in zeromq.mk to refer to the correct patch,
> 0001-acinclude.m4-make-kernel-specific-flags-cacheable.patch
> 
> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
> ---
>  ....m4-make-kernel-specific-flags-cacheable.patch} |    0
>  ...isable-test_fork-if-fork-is-not-available.patch |   52 --------------------
>  ...-Fix-pkg-config-files-for-static-linking.patch} |    0
>  package/zeromq/0004-allow-without-libsodium.patch  |   38 --------------
>  package/zeromq/zeromq.hash                         |    4 +-
>  package/zeromq/zeromq.mk                           |    6 +--
>  6 files changed, 5 insertions(+), 95 deletions(-)
>  rename package/zeromq/{0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch => 0001-acinclude.m4-make-kernel-specific-flags-cacheable.patch} (100%)
>  delete mode 100644 package/zeromq/0001-tests-disable-test_fork-if-fork-is-not-available.patch
>  rename package/zeromq/{0003-libzmq-Fix-pkg-config-files-for-static-linking.patch => 0002-libzmq-Fix-pkg-config-files-for-static-linking.patch} (100%)
>  delete mode 100644 package/zeromq/0004-allow-without-libsodium.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
