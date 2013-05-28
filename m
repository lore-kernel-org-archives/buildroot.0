From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Tue, 28 May 2013 15:55:57 +0200
Subject: [Buildroot] [PATCH] Add HW decoding support for Hantro x170
In-Reply-To: <CAHt8ZCOuz5b36gHziMCoW+d57a3k14tt_pUAZwG-9xi1qQJ6ig@mail.gmail.com>
References: <1369689224-492-1-git-send-email-alexandre.belloni@free-electrons.com>
 <20130528133906.5bfff499@skate>
 <CAHt8ZCOuz5b36gHziMCoW+d57a3k14tt_pUAZwG-9xi1qQJ6ig@mail.gmail.com>
Message-ID: <51A4B76D.8020408@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/05/2013 14:02, Simon Dawson wrote:
> Indeed, this is true. I spent some time trying to get this hardware
> decoder to work, and never managed to get anywhere with it. Atmel
> technical support were incredibly frustrating, providing such pearls
> of wisdom as:
>
> "We found that there might be a little problem if you we use dynamic
> libraries like cannot play video correctly. Our OS experts are still
> working on this."
>
> On the basis of this and other information provided by Atmel, I ended
> up using the static libraries. This complicates the package makefiles
> somewhat, of course; but you can presumably then avoid the restriction
> to glibc.

That's a nice idea, I doubt on2-8170-libs would ever be used without the
gstreamer plugin.

> Alexandre: have you actually managed to get the decoder to work?

It has been working but I don't remember all the specific. That is
something I did quickly for a customer having to create a demo for an
exhibition so the buildroot integration was not really in the scope.

> Simon.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
