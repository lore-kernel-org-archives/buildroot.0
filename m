From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jan 2020 09:30:31 +0100
Subject: [Buildroot] [PATCH/next 1/1] python-nested-dict: new package
In-Reply-To: <20191125194317.925421-1-aduskett@gmail.com>
References: <20191125194317.925421-1-aduskett@gmail.com>
Message-ID: <20200108093031.44f588ac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Nov 2019 11:43:17 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <aduskett@greenlots.com>
> 
> Python dictionary with automatic and arbitrary levels of nestedness.
> 
> Signed-off-by: Adam Duskett <aduskett@greenlots.com>
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  package/python-nested-dict/Config.in               |  7 +++++++
>  package/python-nested-dict/python-nested-dict.hash |  5 +++++
>  package/python-nested-dict/python-nested-dict.mk   | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/python-nested-dict/Config.in
>  create mode 100644 package/python-nested-dict/python-nested-dict.hash
>  create mode 100644 package/python-nested-dict/python-nested-dict.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
