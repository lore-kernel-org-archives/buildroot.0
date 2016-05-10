From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2016 14:38:46 +0200
Subject: [Buildroot] [PATCH 1/7] package/kodi-screensaver-asteroids:
 shorten comment
In-Reply-To: <1462874923-26647-1-git-send-email-bernd.kuhls@t-online.de>
References: <1462874923-26647-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160510143846.4a06b755@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 May 2016 12:08:37 +0200, Bernd Kuhls wrote:

> -comment "kodi-screensaver-asteroids needs an OpenGL backend"
> +comment "asteroids needs an OpenGL backend"
>  	depends on !BR2_PACKAGE_KODI_GL

I am not sure about those patches. We normally want the comments to be:

comment "<package name> needs ..."

So I believe it was actually better the way it was. I see that some
packages are not consistent (i.e they are using the short name and not
the full package name). They should be fixed to use long package name
IMO.

Maybe we could change them to just:

"kodi-screensaver-<foo> needs OpenGL"

This is probably enough compared to "needs an OpenGL backend".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
