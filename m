From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jan 2017 23:17:43 +1300
Subject: [Buildroot] [PATCH v2 1/2] libgpiod: new package
In-Reply-To: <1484827310-13779-2-git-send-email-bgolaszewski@baylibre.com>
References: <1484827310-13779-1-git-send-email-bgolaszewski@baylibre.com>
 <1484827310-13779-2-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20170123231743.5ea2846c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jan 2017 13:01:49 +0100, Bartosz Golaszewski wrote:
> Add a package containing a C library and a set of command-line tools
> for controlling GPIOs from user space using the new character device
> interface on linux.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  package/Config.in              |  1 +
>  package/libgpiod/Config.in     | 20 ++++++++++++++++++++
>  package/libgpiod/libgpiod.hash |  2 ++
>  package/libgpiod/libgpiod.mk   | 14 ++++++++++++++
>  4 files changed, 37 insertions(+)
>  create mode 100644 package/libgpiod/Config.in
>  create mode 100644 package/libgpiod/libgpiod.hash
>  create mode 100644 package/libgpiod/libgpiod.mk

Applied to master, with the following changes:

    [Thomas:
     - add comment about autoreconf=yes (suggested by Romain Naour)
     - add more conventional syntax for the --{enable,disable}-tools usage
       (suggested by Romain Naour)
     - add patch to fix musl build.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
