From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:53:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pyasn: remove duplicate
 package
In-Reply-To: <20200419224719.28092-1-james.hilliard1@gmail.com>
References: <20200419224719.28092-1-james.hilliard1@gmail.com>
Message-ID: <20200420075315.39ee26d3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Apr 2020 16:47:19 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This is a duplicate of python-pyasn1.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  Config.in.legacy                       |  7 +++++++
>  DEVELOPERS                             |  1 -
>  package/Config.in                      |  1 -
>  package/python-pyasn/Config.in         | 14 --------------
>  package/python-pyasn/python-pyasn.hash |  6 ------
>  package/python-pyasn/python-pyasn.mk   | 14 --------------
>  6 files changed, 7 insertions(+), 36 deletions(-)
>  delete mode 100644 package/python-pyasn/Config.in
>  delete mode 100644 package/python-pyasn/python-pyasn.hash
>  delete mode 100644 package/python-pyasn/python-pyasn.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
