From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Nov 2018 08:45:34 +0100
Subject: [Buildroot] Out of tree Linux kernel builds?
In-Reply-To: <02530ea6-3942-3fe1-91b8-9040e3838972@gmail.com>
References: <02530ea6-3942-3fe1-91b8-9040e3838972@gmail.com>
Message-ID: <20181106084534.08bc72ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Florian,

On Mon, 5 Nov 2018 16:08:05 -0800, Florian Fainelli wrote:

> AFAIR a while back you mentioned that you were looking into adding
> support for out of tree Linux builds. Do you have working patches for
> that, or you would rather have someone take a stab at doing it?

In fact we are not planning on supporting out of tree kernel builds,
but rather to support out of tree build for all packages in a generic
way, which would include the 'linux' package of course.

I did some work in this area many years ago, Yann picked up some of the
work, see the current status at
https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/oot.

I see he has other "oot" branches, such as
https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/oot-build-dir,
https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/oot-libtool
and
https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/oot-same-source.
I'm not sure how they relate to each other (I haven't looked at the
patches).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
