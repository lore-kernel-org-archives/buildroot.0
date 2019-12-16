From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 23:30:02 +0100
Subject: [Buildroot] [PATCH 1/2] package/python-smmap2: new package
In-Reply-To: <20191129203841.2197088-1-aduskett@gmail.com>
References: <20191129203841.2197088-1-aduskett@gmail.com>
Message-ID: <20191216233002.562add1b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Nov 2019 12:38:40 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Smmap wraps an interface around mmap and tracks the mapped files as well as the
> amount of clients who use it. If the system runs out of resources, or if a
> memory limit is reached, it will automatically unload unused maps to allow
> continued operation.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/python-smmap2/Config.in          | 10 ++++++++++
>  package/python-smmap2/python-smmap2.hash |  5 +++++
>  package/python-smmap2/python-smmap2.mk   | 14 ++++++++++++++
>  5 files changed, 31 insertions(+)
>  create mode 100644 package/python-smmap2/Config.in
>  create mode 100644 package/python-smmap2/python-smmap2.hash
>  create mode 100644 package/python-smmap2/python-smmap2.mk

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
