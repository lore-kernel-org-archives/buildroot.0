From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 22:28:23 +0200
Subject: [Buildroot] [RFC PATCH v2 1/8] pkg-meson: new infrastructure
In-Reply-To: <20180515195159.6694-2-eric.le.bihan.dev@free.fr>
References: <20180515195159.6694-1-eric.le.bihan.dev@free.fr>
 <20180515195159.6694-2-eric.le.bihan.dev@free.fr>
Message-ID: <20180530222823.13f84157@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 May 2018 21:51:52 +0200, Eric Le Bihan wrote:
> Add a new infrastructure to ease the development of packages that use Meson as
> their build system.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

As I said, I've applied to next, with the following changes:

    [Thomas:
     - move global variables definition outside of the inner-meson-package
       macro
     - for consistency, remove double quote around value passed to meson
       in the host configure step.
     - minor formatting fixes.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
