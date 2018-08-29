From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 10:23:27 +0200
Subject: [Buildroot] [PATCH 1/1] qt5quickcontrols: update license file
 names
In-Reply-To: <20180829061813.9348-1-laurent.hartanerot@gmail.com>
References: <20180829061813.9348-1-laurent.hartanerot@gmail.com>
Message-ID: <20180829102327.399bdd09@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Laurent,

Thanks for this contribution!

On Wed, 29 Aug 2018 08:18:13 +0200, Laurent Hartanerot wrote:
> From: Laurent Hartanerot <laurent.hartanerot@atos.net>
> 
> For the 2018.05.x branch:

Why only for the 2018.05.x branch? The master branch seems to be
affected as well.

> Update license file name for qt5quickcontrols-5.6.3
> (Last version on the 2018.05.x branch)
> 
> Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
> ---
>  package/qt5/qt5quickcontrols/qt5quickcontrols.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
> index 5517cc1537..4afcf5953b 100644
> --- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
> +++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
> @@ -11,7 +11,7 @@ QT5QUICKCONTROLS_DEPENDENCIES = qt5base qt5declarative
>  QT5QUICKCONTROLS_INSTALL_STAGING = YES
> 
>  QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
> -QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.LGPL3 LICENSE.FDL
> +QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.FDL LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3

Is this working for both Qt 5.6 and Qt 5.11 ? Or do we need a
conditional on the Qt version, like we have in qt5serialport.mk for
example ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
