From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:45:52 +0200
Subject: [Buildroot] [PATCH 1/1] spidev_test: Build latest version if
 possible
In-Reply-To: <20170419133044.23558-1-joeri.barbarien@gmail.com>
References: <20170419133044.23558-1-joeri.barbarien@gmail.com>
Message-ID: <20170504224552.473c3c78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Apr 2017 15:30:44 +0200, Joeri Barbarien wrote:
> From: Joeri Barbarien <joeri.barbarien@nokia.com>
> 
> spidev_test has further evolved after kernel version 3.15, which
> is the most recent version that could be built in this package.
> This change allows to build the latest version of spidev_test if
> the toolchain's kernel header version allows it. In this way, when
> building with a newer toolchain, we are able to benefit from the
> added functionality offered by the newest version of the tool.
> 
> Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
> ---
>  package/spidev_test/spidev_test.hash |  2 +-
>  package/spidev_test/spidev_test.mk   | 10 ++++++++--
>  2 files changed, 9 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
