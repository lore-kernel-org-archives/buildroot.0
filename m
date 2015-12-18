From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 22:28:28 +0100
Subject: [Buildroot] [PATCH] python-pyxml: remove obsolete package
In-Reply-To: <1450251868-7288-1-git-send-email-yegorslists@googlemail.com>
References: <1450251868-7288-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20151218222828.26ba769f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Dec 2015 08:44:28 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> PyXML is bitrotten and obsolete. You'll find the functionality it
> previously provided is now included in the Python standard library.
> 
> So no need to keep this package in Buildroot anymore.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                      |  1 -
>  package/python-pyxml/Config.in         | 12 ------------
>  package/python-pyxml/python-pyxml.hash |  2 --
>  package/python-pyxml/python-pyxml.mk   | 17 -----------------
>  4 files changed, 32 deletions(-)
>  delete mode 100644 package/python-pyxml/Config.in
>  delete mode 100644 package/python-pyxml/python-pyxml.hash
>  delete mode 100644 package/python-pyxml/python-pyxml.mk

As Yann said, can you respin this patch after taking care of
Config.in.legacy handling ?

Or maybe instead of removing the package we should mark it as
deprecated ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
