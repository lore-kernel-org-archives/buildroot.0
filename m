From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 18:32:58 +0200
Subject: [Buildroot] [PATCH 2/2] configs: new defconfig for
 beaglebone_qt5
In-Reply-To: <1474582849-10730-2-git-send-email-lothar.felten@gmail.com>
References: <1474582849-10730-1-git-send-email-lothar.felten@gmail.com>
 <1474582849-10730-2-git-send-email-lothar.felten@gmail.com>
Message-ID: <20161015183258.1463f9c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Sep 2016 00:20:49 +0200, Lothar Felten wrote:
> Add a target configuration for the beaglebone that supports the SGX530
> graphics acceleration and builds the qt5 demos with the eglfs backend.
> The imagination technologies demos and fbv are also included.
> The linux kernel is based on the omap2plus defconfig, a config fragment
> adds the required settings for SGX accelerator support.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> ---
>  board/beaglebone/linux-4.1-sgx.fragment | 12 ++++++++++
>  board/beaglebone/readme.txt             |  2 +-
>  configs/beaglebone_qt5_defconfig        | 39 +++++++++++++++++++++++++++++++++
>  3 files changed, 52 insertions(+), 1 deletion(-)
>  create mode 100644 board/beaglebone/linux-4.1-sgx.fragment
>  create mode 100644 configs/beaglebone_qt5_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
