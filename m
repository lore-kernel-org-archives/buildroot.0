From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 20:54:28 +0200
Subject: [Buildroot] [PATCH 1/1] python-fastentrypoints: new package
In-Reply-To: <20180409180403.11728-1-asafka7@gmail.com>
References: <20180409180403.11728-1-asafka7@gmail.com>
Message-ID: <20181020205428.449d53ae@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Apr 2018 21:04:03 +0300, Asaf Kahlon wrote:
> host-package that is able to shorten the load time of entry_points declared
> in setup.py of python packages.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in.host                             |  1 +
>  package/python-fastentrypoints/Config.in.host      |  6 ++++++
>  .../python-fastentrypoints.hash                    |  4 ++++
>  .../python-fastentrypoints.mk                      | 14 ++++++++++++++
>  5 files changed, 26 insertions(+)
>  create mode 100644 package/python-fastentrypoints/Config.in.host
>  create mode 100644 package/python-fastentrypoints/python-fastentrypoints.hash
>  create mode 100644 package/python-fastentrypoints/python-fastentrypoints.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
