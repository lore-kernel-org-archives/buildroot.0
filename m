From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 15:40:53 +0200
Subject: [Buildroot] [PATCH 2/2] python-pigpio: new package
In-Reply-To: <20180928180034.6543-2-grzegorz@blach.pl>
References: <20180928180034.6543-1-grzegorz@blach.pl>
 <20180928180034.6543-2-grzegorz@blach.pl>
Message-ID: <20181009154053.2f01b0a1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Sep 2018 20:00:34 +0200, Grzegorz Blach wrote:
> Pigpio is a Python module for the Raspberry Pi
> which talks to the pigpio daemon to allow control
> of the general purpose input outputs (GPIO).
> 
> http://abyz.co.uk/rpi/pigpio/python.html
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/python-pigpio/Config.in          |  8 ++++++++
>  package/python-pigpio/python-pigpio.hash |  3 +++
>  package/python-pigpio/python-pigpio.mk   | 13 +++++++++++++
>  5 files changed, 26 insertions(+)
>  create mode 100644 package/python-pigpio/Config.in
>  create mode 100644 package/python-pigpio/python-pigpio.hash
>  create mode 100644 package/python-pigpio/python-pigpio.mk

I've applied, with just a fix to use the proper SPDX license tag.

Could you ask the upstream project to add a license file to the
tarball ? It would be a nice addition.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
