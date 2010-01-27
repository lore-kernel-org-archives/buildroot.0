From: Julien Boibessot <julien.boibessot@free.fr>
Date: Wed, 27 Jan 2010 16:35:07 +0100
Subject: [Buildroot] [PATCH] "libdir" variable is not set correctly in
 (generated) $(STAGING_DIR)/usr/lib/libSDL.la
In-Reply-To: <4d28d4b51001270659v6ca5a6e9ne6015d6bbc4e39a0@mail.gmail.com>
References: <1264604070-7294-1-git-send-email-julien.boibessot@free.fr>
	<4d28d4b51001270659v6ca5a6e9ne6015d6bbc4e39a0@mail.gmail.com>
Message-ID: <4B605D2B.9050205@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lionel,

Lionel Landwerlin a ?crit :
> It already handled in Makefile.autotools.in
> <http://Makefile.autotools.in>. That's why you see the path to the
> staging directory twice, it's twice processed.
> You can just remove the line.
you mean: converting package/sdl/sdl.mk to autotools infrastructure will
solve the problem ?

Regards,
Julien
