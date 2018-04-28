From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 18:35:46 +0200
Subject: [Buildroot] [V2] chipmunk: new package
In-Reply-To: <20180411100146.19494-1-francois.perrad@gadz.org>
References: <20180411100146.19494-1-francois.perrad@gadz.org>
Message-ID: <20180428183546.48e1e8f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Apr 2018 12:01:46 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/chipmunk/Config.in     | 12 ++++++++++++
>  package/chipmunk/chipmunk.hash |  5 +++++
>  package/chipmunk/chipmunk.mk   | 16 ++++++++++++++++
>  5 files changed, 35 insertions(+)
>  create mode 100644 package/chipmunk/Config.in
>  create mode 100644 package/chipmunk/chipmunk.hash
>  create mode 100644 package/chipmunk/chipmunk.mk

I've applied, after adding some logic to make use of the BUILD_STATIC,
BUILD_SHARED and INSTALL_STATIC options.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
