From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 8 Jul 2007 18:09:27 +0200 (CEST)
Subject: [Buildroot] package/gettext trouble
In-Reply-To: <5d75f4610707080807s537e297boa21ea7659cc8c331@mail.gmail.com>
References: <0707081654290.3987@somehost>
	<5d75f4610707080807s537e297boa21ea7659cc8c331@mail.gmail.com>
Message-ID: <0707081802430.3987@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 8 Jul 2007, BuraphaLinux Server wrote:

> I get this too; is it some environment setting or does everybody get it?

Looks like there's a catch 22 situation here :(
I can't build package ed-0.6 because it requires pkg-config, which
requires gettext, which doesn't build.

Looks like it's critical to get a gettext clean build before going any
further.  Any offers?


-- 
Cristian
