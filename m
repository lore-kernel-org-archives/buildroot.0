From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:58:48 +0200
Subject: [Buildroot] [PATCH 1/3] package/enet: new package
In-Reply-To: <20190422171049.22034-1-romain.naour@gmail.com>
References: <20190422171049.22034-1-romain.naour@gmail.com>
Message-ID: <20190424225848.41540d2f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Apr 2019 19:10:47 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> enet will be used by supertuxkart 1.0.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> Build tested with test-pkg -a
> ---
>  DEVELOPERS             |  1 +
>  package/Config.in      |  1 +
>  package/enet/Config.in | 16 ++++++++++++++++
>  package/enet/enet.hash |  3 +++
>  package/enet/enet.mk   | 14 ++++++++++++++
>  5 files changed, 35 insertions(+)
>  create mode 100644 package/enet/Config.in
>  create mode 100644 package/enet/enet.hash
>  create mode 100644 package/enet/enet.mk

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
