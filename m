From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 14:08:56 +0100
Subject: [Buildroot] [PATCH] package/cctz: new package
In-Reply-To: <20191222132314.15130-1-gilles.talis@gmail.com>
References: <20191222132314.15130-1-gilles.talis@gmail.com>
Message-ID: <20191224140856.793611d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Dec 2019 14:23:14 +0100
Gilles Talis <gilles.talis@gmail.com> wrote:

> CCTZ is a C++ library for translating between absolute
> and civil times using the rules of a time zone.
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
>  DEVELOPERS             |  1 +
>  package/Config.in      |  1 +
>  package/cctz/Config.in | 29 +++++++++++++++++++++++++++++
>  package/cctz/cctz.hash |  3 +++
>  package/cctz/cctz.mk   | 27 +++++++++++++++++++++++++++
>  5 files changed, 61 insertions(+)
>  create mode 100644 package/cctz/Config.in
>  create mode 100644 package/cctz/cctz.hash
>  create mode 100644 package/cctz/cctz.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
