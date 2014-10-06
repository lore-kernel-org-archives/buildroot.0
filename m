From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 21:15:45 +0200
Subject: [Buildroot] [PATCH] tinyalsa: new package
In-Reply-To: <1412531488-8849-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1412531488-8849-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141006211545.025b58c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun,  5 Oct 2014 19:51:28 +0200, Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/Config.in            |  1 +
>  package/tinyalsa/Config.in   | 14 ++++++++++++++
>  package/tinyalsa/tinyalsa.mk | 34 ++++++++++++++++++++++++++++++++++
>  3 files changed, 49 insertions(+)
>  create mode 100644 package/tinyalsa/Config.in
>  create mode 100644 package/tinyalsa/tinyalsa.mk

Thanks, applied, after doing a few changes:

    [Thomas:
     - remove 'default n', since it's the default
     - add dependency on !BR2_PREFER_STATIC_LIB since the Makefile always
       builds a shared library.
     - move from Audio/video applications to Libraries -> Audio.]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
