From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 22:41:37 +0200
Subject: [Buildroot] [PATCH 1/1] python-pip: new package
In-Reply-To: <20180806224615.31245-1-aduskett@gmail.com>
References: <20180806224615.31245-1-aduskett@gmail.com>
Message-ID: <20180809224137.281ced31@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Aug 2018 18:46:15 -0400, Adam Duskett wrote:
> A useful tool for managing and installing python packages.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  DEVELOPERS                         |  1 +
>  package/Config.in                  |  1 +
>  package/python-pip/Config.in       |  6 ++++++
>  package/python-pip/python-pip.hash |  5 +++++
>  package/python-pip/python-pip.mk   | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-pip/Config.in
>  create mode 100644 package/python-pip/python-pip.hash
>  create mode 100644 package/python-pip/python-pip.mk

I don't find python-pip very useful, because it allows the installation
of Python packages at runtime on the target, while normally the
principle of Buildroot is that everything is built/installed at build
time, on the build machine.

But perhaps this may be useful in some situations, and the package is
simple enough, so I've applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
