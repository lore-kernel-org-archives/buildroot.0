From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 21:42:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/flare-engine: new package
In-Reply-To: <20180319211903.11539-1-romain.naour@gmail.com>
References: <20180319211903.11539-1-romain.naour@gmail.com>
Message-ID: <20180409214212.12ad59c5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Mar 2018 22:19:02 +0100, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> Tested with test-pkg.
> ---
>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  1 +
>  package/flare-engine/Config.in         | 19 +++++++++++++++++++
>  package/flare-engine/flare-engine.hash |  3 +++
>  package/flare-engine/flare-engine.mk   | 17 +++++++++++++++++
>  5 files changed, 41 insertions(+)
>  create mode 100644 package/flare-engine/Config.in
>  create mode 100644 package/flare-engine/flare-engine.hash
>  create mode 100644 package/flare-engine/flare-engine.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
