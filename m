From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Tue, 20 Nov 2007 14:07:48 +0200
Subject: [Buildroot] SDL fails for Buildroot arm926ejs toolchain
In-Reply-To: <13848331.post@talk.nabble.com>
References: <13830846.post@talk.nabble.com> <4741755A.5010404@promwad.com>
	<13848331.post@talk.nabble.com>
Message-ID: <4742CE14.2060802@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hebbar wrote:
> 
> #
> # SDL options selection
> #
> BR2_PACKAGE_SDL_FBCON=y
> BR2_PACKAGE_SDL_DIRECTFB=y
> # BR2_PACKAGE_SDL_QTOPIA is not set
> BR2_PACKAGE_SDL_X11=y
> # BR2_PACKAGE_SDL_TTF is not set
> # BR2_PACKAGE_TIFF is not set
> 

Try enabling only BR2_PACKAGE_SDL_FBCON=y

Regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
