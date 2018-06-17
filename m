From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:17:21 +0200
Subject: [Buildroot] [PATCH] gnutls: use included unistring unless
 libunistring is selected
In-Reply-To: <20180615084838.7642-1-neumann@teufel.de>
References: <20180615084838.7642-1-neumann@teufel.de>
Message-ID: <20180617141721.6b5dcc95@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Jun 2018 10:48:38 +0200, Sven Neumann wrote:
> Use the included copy of libunistring unless BR2_PACKAGE_LIBUNISTRING
> is already selected.
> 
> The resulting gnutls library with libunistring included is about 1.2 MB
> smaller than the sum of libgnutls and libunistring.
> 
> Signed-off-by: Sven Neumann <neumann@teufel.de>
> ---
>  package/gnutls/Config.in |  1 -
>  package/gnutls/gnutls.mk | 10 ++++++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
