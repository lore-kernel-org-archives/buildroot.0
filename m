From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 23:03:23 +0200
Subject: [Buildroot] [PATCH 1/1] configs/globalscale_espressobin: new
 defconfig
In-Reply-To: <20200508094509.2574240-1-troglobit@gmail.com>
References: <20200508094509.2574240-1-troglobit@gmail.com>
Message-ID: <20200725230323.6fca1114@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 May 2020 11:45:09 +0200
Joachim Nilsson <troglobit@gmail.com> wrote:

> Basic support for the Marvell ESPRESSObin, by Globalscale Technologies.
> 
>   http://espressobin.net
> 
> The kernel config has been extended with a fragment to enable switchcore
> support, DSA drivers, and VLAN filtering in the bridge.  To make use of
> this you need a custom libnl based application, or the iproute2 suite
> rather than the brctl tools, which don't support the VLAN filtering.
> 
> Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
> ---
>  .gitlab-ci.yml                                |  1 +
>  DEVELOPERS                                    |  4 +
>  board/globalscale/espressobin/genimage.cfg    | 11 +++
>  .../espressobin/linux-extras.config           | 14 +++
>  board/globalscale/espressobin/readme.txt      | 90 +++++++++++++++++++
>  configs/globalscale_espressobin_defconfig     | 26 ++++++
>  6 files changed, 146 insertions(+)
>  create mode 100644 board/globalscale/espressobin/genimage.cfg
>  create mode 100644 board/globalscale/espressobin/linux-extras.config
>  create mode 100644 board/globalscale/espressobin/readme.txt
>  create mode 100644 configs/globalscale_espressobin_defconfig

Thanks, applied !

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
