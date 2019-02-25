From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Feb 2019 22:08:43 +0100
Subject: [Buildroot] [PATCH] package/libssh: bump to version 0.8.7
In-Reply-To: <0904247310e27e331d4211c5d85d14490a82cf99.1551124488.git.baruch@tkos.co.il>
References: <0904247310e27e331d4211c5d85d14490a82cf99.1551124488.git.baruch@tkos.co.il>
Message-ID: <20190225220843.213d2a35@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Feb 2019 21:54:48 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> Drop upstream patch.
> 
> Fixes strict-overflow build error with older toolchains.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b95b1939a55111fc6b90ef253a32402b87f9c4ab/
> http://autobuild.buildroot.net/results/281cb7b940178e4fe98940ddeed07ad546b23931/
> http://autobuild.buildroot.net/results/e95d5957c19ff01120903a66d1167279a34da2ce/
> 
> Cc: Scott Fan <fancp2007@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...x-size-type-for-i-an-j-in-ssh_select.patch | 29 -------------------
>  package/libssh/libssh.hash                    |  4 +--
>  package/libssh/libssh.mk                      |  2 +-
>  3 files changed, 3 insertions(+), 32 deletions(-)
>  delete mode 100644 package/libssh/0004-connect-Fix-size-type-for-i-an-j-in-ssh_select.patch

Applied to master, thanks: it fixes a build issue, and there are very
few upstream commits between 0.8.6 and 0.8.7.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
