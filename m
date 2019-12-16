From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:38:57 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/pipewire: new package
In-Reply-To: <20190826023402.39124-1-james.hilliard1@gmail.com>
References: <20190826023402.39124-1-james.hilliard1@gmail.com>
Message-ID: <20191216223857.49668678@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 25 Aug 2019 20:34:02 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> PipeWire is a server and user space API to deal with multimedia
> pipelines.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/pipewire/Config.in     |  9 +++++++++
>  package/pipewire/pipewire.hash |  4 ++++
>  package/pipewire/pipewire.mk   | 22 ++++++++++++++++++++++
>  5 files changed, 37 insertions(+)
>  create mode 100644 package/pipewire/Config.in
>  create mode 100644 package/pipewire/pipewire.hash
>  create mode 100644 package/pipewire/pipewire.mk

I switched from a "depends on BR2_PACKAGE_DBUS" to a "select
BR2_PACKAGE_DBUS", adding the necessary dependencies along the way. I
also bumped to the latest version of pipewire, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
