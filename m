From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Nov 2017 23:12:13 +0100
Subject: [Buildroot] [PATCH next] libnl: bump to version 3.4.0
In-Reply-To: <a6f7e751386a971150355817e83615d71e231abd.1510663005.git.baruch@tkos.co.il>
References: <a6f7e751386a971150355817e83615d71e231abd.1510663005.git.baruch@tkos.co.il>
Message-ID: <20171115231213.4ff4686a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Nov 2017 14:36:45 +0200, Baruch Siach wrote:
> Drop static build fix patch; upstream fixed static build in a different
> way (https://github.com/thom311/libnl/pull/141).
> 
> Following the patch removal, autoreconf is not needed anymore.
> 
> Add license hash.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...rt-build-enable-building-cli-during-tests.patch | 115 ---------------------
>  package/libnl/libnl.hash                           |   6 +-
>  package/libnl/libnl.mk                             |   4 +-
>  3 files changed, 5 insertions(+), 120 deletions(-)
>  delete mode 100644 package/libnl/0003-Revert-build-enable-building-cli-during-tests.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
