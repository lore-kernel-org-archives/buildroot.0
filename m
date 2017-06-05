From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:50:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/doxygen: bump version to 1.8.13,
 switch to cmake
In-Reply-To: <20170602181610.29404-1-bernd.kuhls@t-online.de>
References: <20170602181610.29404-1-bernd.kuhls@t-online.de>
Message-ID: <20170605115031.74020112@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Jun 2017 20:16:10 +0200, Bernd Kuhls wrote:
> Doxygen switched to cmake with release 1.8.10:
> http://www.stack.nl/~dimitri/doxygen/manual/changelog.html#log_1_8_10
> 
> and added support for flex 2.6.0 with release 1.8.11:
> http://www.stack.nl/~dimitri/doxygen/manual/changelog.html#log_1_8_11
> 
> Fixes
> http://autobuild.buildroot.net/results/ba1/ba1444709523c59393aaaa3710e9933bafacc6b5/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/doxygen/doxygen.hash |  2 +-
>  package/doxygen/doxygen.mk   | 19 ++-----------------
>  2 files changed, 3 insertions(+), 18 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
