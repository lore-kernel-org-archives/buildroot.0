From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 23:23:29 +0200
Subject: [Buildroot] [PATCH v3] python-systemd: add new package
In-Reply-To: <20170717210750.9636-1-andrew.smirnov@gmail.com>
References: <20170717210750.9636-1-andrew.smirnov@gmail.com>
Message-ID: <20170720232329.2f679d25@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Jul 2017 14:07:50 -0700, Andrey Smirnov wrote:
> Add package for official python bindings availibe as a part of systemd
> project at: https://github.com/systemd/python-systemd
> 
> Minimal config snippet for utils/test-pkg is as follows (sans
> backslashes):
> 
> # BR2_INIT_BUSYBOX is not set
> # BR2_INIT_SYSV is not set
> BR2_INIT_SYSTEMD=y
> # BR2_INIT_NONE is not set
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON_SYSTEMD=y
> 
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/python-systemd/Config.in           | 10 ++++++++++
>  package/python-systemd/python-systemd.hash |  3 +++
>  package/python-systemd/python-systemd.mk   | 15 +++++++++++++++
>  5 files changed, 30 insertions(+)
>  create mode 100644 package/python-systemd/Config.in
>  create mode 100644 package/python-systemd/python-systemd.hash
>  create mode 100644 package/python-systemd/python-systemd.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
