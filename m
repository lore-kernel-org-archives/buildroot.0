From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 20:51:17 +0200
Subject: [Buildroot] [PATCH 1/2] python-docutils: new package
In-Reply-To: <20160921134044.29040-1-yegorslists@googlemail.com>
References: <20160921134044.29040-1-yegorslists@googlemail.com>
Message-ID: <20160921205117.2e8c2002@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Sep 2016 15:40:43 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Host variant is needed for building python-daemon package.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                            |  1 +
>  package/python-docutils/Config.in            |  9 +++++++++
>  package/python-docutils/python-docutils.hash |  3 +++
>  package/python-docutils/python-docutils.mk   | 15 +++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-docutils/Config.in
>  create mode 100644 package/python-docutils/python-docutils.hash
>  create mode 100644 package/python-docutils/python-docutils.mk

I slightly tweaked the description of the licenses, and then applied.
And indeed, this package is quite complicated in terms of licenses... I
hope what I've added is good enough. Hopefully other Buildroot
developers can have a look and suggest better descriptions if needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
