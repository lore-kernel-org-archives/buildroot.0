From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 15:57:29 +0200
Subject: [Buildroot] [PATCH 1/1] shapelib: new package
In-Reply-To: <1469969150-3029-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1469969150-3029-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20160921155729.1c4332b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jul 2016 14:45:50 +0200, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>  package/Config.in              |  1 +
>  package/shapelib/Config.in     |  8 ++++++++
>  package/shapelib/shapelib.hash |  3 +++
>  package/shapelib/shapelib.mk   | 25 +++++++++++++++++++++++++
>  4 files changed, 37 insertions(+)
>  create mode 100644 package/shapelib/Config.in
>  create mode 100644 package/shapelib/shapelib.hash
>  create mode 100644 package/shapelib/shapelib.mk

Thanks, I've applied your patch, after doing the following changes:

    [Thomas:
     - adjust the license: it's MIT or LGPLv2, add web/license.html to the
       license files
     - rewrap Config.in help text
     - add entry to the DEVELOPERS file.]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
