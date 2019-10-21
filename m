From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 22:00:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/openlayers: new package
In-Reply-To: <20191017131851.26272-1-thomas.claveirole@green-communications.fr>
References: <20191017131851.26272-1-thomas.claveirole@green-communications.fr>
Message-ID: <20191021220059.3cd5b153@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 17 Oct 2019 15:18:50 +0200
Thomas Claveirole <thomas.claveirole@green-communications.fr> wrote:

> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/Config.in                  |  1 +
>  package/openlayers/Config.in       | 11 +++++++++++
>  package/openlayers/openlayers.hash |  2 ++
>  package/openlayers/openlayers.mk   | 24 ++++++++++++++++++++++++
>  4 files changed, 38 insertions(+)
>  create mode 100644 package/openlayers/Config.in
>  create mode 100644 package/openlayers/openlayers.hash
>  create mode 100644 package/openlayers/openlayers.mk

Applied to master, thanks. I forgot that an entry in the DEVELOPERS
file should be added: can you send a follow-up patch adding it ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
