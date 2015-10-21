From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Oct 2015 10:07:33 +0200
Subject: [Buildroot] [PATCH 1/1] sdl: fix incorrect SDL_CONF_OPTS
	assignment
In-Reply-To: <1445397025-21211-1-git-send-email-rprebello@gmail.com> (Rodrigo
 Rebello's message of "Wed, 21 Oct 2015 01:10:25 -0200")
References: <1445397025-21211-1-git-send-email-rprebello@gmail.com>
Message-ID: <87k2qgir0a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rodrigo" == Rodrigo Rebello <rprebello@gmail.com> writes:

 > The option --enable-video-directfb=no was being assigned to
 > SDL_CONF_OPTS instead of being appended to it when
 > BR2_PACKAGE_SDL_DIRECTFB was disabled. That would clobber any options
 > previously added to SDL_CONF_OPTS (namely --enable-video-fbcon=yes|no).

 > Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
