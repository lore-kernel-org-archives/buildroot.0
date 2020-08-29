From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:35:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/watchdog: new package
In-Reply-To: <20200808214815.1358140-1-alejandro.gonzalez.correo@gmail.com>
References: <20200808214815.1358140-1-alejandro.gonzalez.correo@gmail.com>
Message-ID: <20200829143536.6e7e0ce5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  8 Aug 2020 23:48:15 +0200
Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com> wrote:

> watchdog is a flexible watchdog daemon that improves on the already
> available Busybox watchdog daemon by providing more advanced features,
> like defining custom system status checks and executing repair scripts
> to react upon invariants that don't hold.
> 
> Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>

Thanks, I've applied to next. I've handled the potential conflict with
Busybox, which also has a "watchdog" applet.

I've also addressed the comments from Asaf about the DEVELOPERS entry
and the AUTORECONF = YES, but I forgot to do that initially, so I did
follow-up commits for these.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
