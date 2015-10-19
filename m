From: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@freescale.com>
Date: Mon, 19 Oct 2015 15:45:33 +0200
Subject: [Buildroot] [PATCH V4] sdl2: new package
In-Reply-To: <55AAA19F.60905@openwide.fr>
Message-ID: <20151019134532.GA12643@laptop-vstehle>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillaume and Romain,

Thank you for your effort on this nice sdl2 buildroot patch. I hope you
are still working on it.

While trying v5 of the path recently, as found in buildroot patchwork, I
needed to add the following line to sdl2.mk:

	SDL2_CONFIG_SCRIPTS = sdl2-config

Without this line, the include path returned by `sdl2-config --cflags`
will be something like /usr/include/SDL2, instead of pointing to the
buildroot staging dir.

You might want to add it to a v6, maybe?

Apart from that, it works fine for me, thanks!

Best regards,

V.
