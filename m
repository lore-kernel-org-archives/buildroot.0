From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 21:47:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/qlibc: fix musl build by
 removing usage of internal glibc header sys/cdefs.h
In-Reply-To: <1463818533-14713-1-git-send-email-bernd.kuhls@t-online.de>
References: <1463818533-14713-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160522214748.6f8b76e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 May 2016 10:15:33 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/15c/15ce460214875c2e56d5d26372778b43cd7325ad/
> http://autobuild.buildroot.net/results/790/79098fb27ef2d5b09df777cd7365a61d6de55c52/
> http://autobuild.buildroot.net/results/8d3/8d3dad2dcf5b3c7fa94cc759386759b1ac9e3287/
> http://autobuild.buildroot.net/results/9d8/9d8f6259c62e15cc528ec99d6375cc02c2bc7489/
> http://autobuild.buildroot.net/results/a05/a0540ed23bd2d48cd742aa1b0228719b13e162b6/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...l-build-by-removing-usage-of-internal-gli.patch | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/qlibc/0004-md5-fix-musl-build-by-removing-usage-of-internal-gli.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
