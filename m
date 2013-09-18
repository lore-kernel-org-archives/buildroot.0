From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 19:22:19 +0200
Subject: [Buildroot] [PATCH 3/5] qt5sensors: new package
In-Reply-To: <1379485693-822-4-git-send-email-fatih.asici@gmail.com>
References: <1379485693-822-1-git-send-email-fatih.asici@gmail.com>
 <1379485693-822-4-git-send-email-fatih.asici@gmail.com>
Message-ID: <20130918192219.268b948f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Wed, 18 Sep 2013 09:28:11 +0300, Fatih A??c? wrote:

> +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> +QT5SENSORS_LICENSE = LGPLv2.1 or GPLv3.0
> +# Here we would like to get license files from qt5base, but qt5base
> +# may not be extracted at the time we get the legal-info for
> +# qt5script.

This seems copy/pasted from older packages, while the qt5sensors
tarball in fact has license files. This should also be fixed similarly
in patches 4 and 5.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
