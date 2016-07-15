From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 16:41:11 +0200
Subject: [Buildroot] [PATCH 3/3] sdl2_ttf: new package
In-Reply-To: <1468335185-19378-3-git-send-email-peter.macleod.thompson@gmail.com>
References: <1468335185-19378-1-git-send-email-peter.macleod.thompson@gmail.com>
 <1468335185-19378-3-git-send-email-peter.macleod.thompson@gmail.com>
Message-ID: <20160715164111.5606b6b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 08:53:05 -0600, Peter Thompson wrote:
> sdl2_ttf created from sdl_ttf with some minor changes
> 
> Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
> ---
>  package/Config.in              |  1 +
>  package/sdl2_ttf/Config.in     |  9 +++++++++
>  package/sdl2_ttf/sdl2_ttf.hash |  2 ++
>  package/sdl2_ttf/sdl2_ttf.mk   | 20 ++++++++++++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 package/sdl2_ttf/Config.in
>  create mode 100644 package/sdl2_ttf/sdl2_ttf.hash
>  create mode 100644 package/sdl2_ttf/sdl2_ttf.mk

Applied after doing the following changes:

    [Thomas:
     - point <pkg>_LICENSE_FILES to a file that actually exists
     - add host-pkgconf to the dependencies
     - remove unneeded CONF_OPTS options
     - pass FREETYPE_CONFIG in the environment to point to freetype-config]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
