From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 14:13:26 +0100
Subject: [Buildroot] [PATCH] [PATCH] package/tio: new package
In-Reply-To: <20191222221203.1990-1-sergio.prado@e-labworks.com>
References: <20191222221203.1990-1-sergio.prado@e-labworks.com>
Message-ID: <20191224141326.1942ba21@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Dec 2019 19:12:03 -0300
Sergio Prado <sergio.prado@e-labworks.com> wrote:

> "tio" is a simple TTY terminal application which features a
> straightforward commandline interface to easily connect to
> TTY devices for basic input/output.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  DEVELOPERS            |  1 +
>  package/Config.in     |  1 +
>  package/tio/Config.in |  8 ++++++++
>  package/tio/tio.hash  |  5 +++++
>  package/tio/tio.mk    | 13 +++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/tio/Config.in
>  create mode 100644 package/tio/tio.hash
>  create mode 100644 package/tio/tio.mk

Applied to master after adjusting TIO_LICENSE to GPL-2.0+, as noticed
by Baruch. Nice little program BTW, the automatic reconnect to USB
serial devices can be quite useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
