From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Dec 2011 14:53:26 +0100
Subject: [Buildroot] XWindow Browser, anyone ?
In-Reply-To: <CAOrUntZhzjati0cHKQp0s=ov-eoLaeGDjz987qjSZ=1ZMFYA-A@mail.gmail.com>
References: <CAOrUntZhzjati0cHKQp0s=ov-eoLaeGDjz987qjSZ=1ZMFYA-A@mail.gmail.com>
Message-ID: <20111219145326.226d43f1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 19 Dec 2011 09:05:36 +0100,
Andrea Benini <andreabenini@gmail.com> a ?crit :

> Has someone ever ported a browser suitable for X ?
> I've seen Lynx in packages directory but I'm just looking for
> something nice for XWindow, I'm trying to compile XUL for Firefox but
> it seems to be hard with uclibc libs.
> Is there someone with a package for Firefox, Chromium, Opera or
> something else available under X ? I'd like to create a minimal
> XWindow system with a browser but without success yet, and of course
> I'm not interested in Chromium OS, buildroot system is still my
> favorite choice.

You can have a look at Midori, for which we have a package in
Buildroot. Another alternative is to use the WebKit rendering engine
built-in with Qt and develop a small web browser in Qt with a few lines
of code (there are many examples available on the Web), or even to
compile a simple Qt-based web browser.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
