From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 15:00:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pyasn-modules: remove
 duplicate package
In-Reply-To: <20200419085011.103843-1-james.hilliard1@gmail.com>
References: <20200419085011.103843-1-james.hilliard1@gmail.com>
Message-ID: <20200419150017.5f12df64@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Apr 2020 02:50:11 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This is a duplicate of python-pyasn1-modules.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  Config.in.legacy                                   |  7 +++++++
>  DEVELOPERS                                         |  1 -
>  package/Config.in                                  |  1 -
>  package/python-pyasn-modules/Config.in             | 11 -----------
>  .../python-pyasn-modules/python-pyasn-modules.hash |  5 -----
>  .../python-pyasn-modules/python-pyasn-modules.mk   | 14 --------------
>  6 files changed, 7 insertions(+), 32 deletions(-)
>  delete mode 100644 package/python-pyasn-modules/Config.in
>  delete mode 100644 package/python-pyasn-modules/python-pyasn-modules.hash
>  delete mode 100644 package/python-pyasn-modules/python-pyasn-modules.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
