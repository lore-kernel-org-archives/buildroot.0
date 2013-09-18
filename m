From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 18:27:09 +0200
Subject: [Buildroot] [PATCH v1] Fix EGL support in qt5base
In-Reply-To: <208f618f05b351b3ef2eddf624978189@sysmic.org>
References: <CA+csPL67CJSJHgfhgnJJfBcw+LUszPWT3VwFCEFw5n3Oy4jN1Q@mail.gmail.com>
 <1379411589-8935-1-git-send-email-jezz@sysmic.org>
 <20130917203313.0da278a9@skate>
 <208f618f05b351b3ef2eddf624978189@sysmic.org>
Message-ID: <20130918182709.7a845c19@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Wed, 18 Sep 2013 13:13:57 +0200, J?r?me Pouiller wrote:

> > I'm sorry, but this really looks ugly.
> I agree :-)
> 
> In fact, I mainly  wrote this patch as a work around for  one of my 
> imx6
> compilations. I sent it only because Espen seemed to have same issue.

Ok, no problem :)

> > ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
> > QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
> > 	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp
> > endif
> My idea  was QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES may not  be 
> sufficient
> to  support all  future cases  and we  may have  a more  generic way  
> to
> customize qmake.conf. But I am agree, this case is not yet arrived.

Of course, this might happen, but until that happens, let's not plan
something in advance without having any idea of what will exactly
happen :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
