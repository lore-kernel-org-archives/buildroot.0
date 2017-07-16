From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 16:22:28 +0200
Subject: [Buildroot] [PATCH] python-zope-interface: bump to version 4.4.2
In-Reply-To: <20170713065822.28446-1-yegorslists@googlemail.com>
References: <20170713065822.28446-1-yegorslists@googlemail.com>
Message-ID: <20170716162228.5ed80de7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jul 2017 08:58:22 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Add setuptools as a runtime dependency because zope-interface
> uses pkg_resources during initialization.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-zope-interface/Config.in                  | 1 +
>  package/python-zope-interface/python-zope-interface.hash | 4 ++--
>  package/python-zope-interface/python-zope-interface.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
