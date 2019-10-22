From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 23:33:09 +0200
Subject: [Buildroot] [PATCH v3 5/9] package/libnetconf2: add package
In-Reply-To: <20191011124131.28246-6-heiko.thiery@gmail.com>
References: <20191011124131.28246-1-heiko.thiery@gmail.com>
 <20191011124131.28246-6-heiko.thiery@gmail.com>
Message-ID: <20191022233309.5a4522c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Oct 2019 14:40:43 +0200
heiko.thiery at gmail.com wrote:

> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> libnetconf2 is a NETCONF library in C intended for building
> NETCONF clients and servers.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  .../0001-Add-support-for-musl-libc.patch      | 65 +++++++++++++++++++
>  package/libnetconf2/Config.in                 | 15 +++++
>  package/libnetconf2/libnetconf2.hash          |  2 +
>  package/libnetconf2/libnetconf2.mk            | 40 ++++++++++++
>  6 files changed, 124 insertions(+)
>  create mode 100644 package/libnetconf2/0001-Add-support-for-musl-libc.patch
>  create mode 100644 package/libnetconf2/Config.in
>  create mode 100644 package/libnetconf2/libnetconf2.hash
>  create mode 100644 package/libnetconf2/libnetconf2.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
