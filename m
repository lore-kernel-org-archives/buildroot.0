From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 17:44:27 +0200
Subject: [Buildroot] [PATCH] package/python-networkx: bump to 2.4
In-Reply-To: <20200715153845.1915659-1-antoine.tenart@bootlin.com>
References: <20200715153845.1915659-1-antoine.tenart@bootlin.com>
Message-ID: <20200715174427.33fcfb00@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 17:38:45 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> python-networkx wasn't upgraded for a while due to incompatibilities
> with setools not supporting versions above 1.11. With the recent version
> bump of setools this is no longer true and we can bump python-networkx
> to 2.4.
> 
> The license checksum had to be updated while bumping the package, but
> only the year of the copyright has changed.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
> ---
>  package/python-networkx/python-networkx.hash | 8 ++++----
>  package/python-networkx/python-networkx.mk   | 5 ++---
>  2 files changed, 6 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
