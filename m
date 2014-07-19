From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 17:13:33 +0200
Subject: [Buildroot] Raspberry + Usb to TTL Serial Cable issue
In-Reply-To: <CAK9TtU06LT6oep-7sYZTVjpVqRbc-DN0pCMrK28f230dTirupA@mail.gmail.com>
References: <CAK9TtU2hWsQ7J5yJMjLG9rOX9V+ga817bZbvAj0pj5ZHE92Beg@mail.gmail.com>
 <20140719160709.2b2bcfae@free-electrons.com>
 <CAK9TtU06LT6oep-7sYZTVjpVqRbc-DN0pCMrK28f230dTirupA@mail.gmail.com>
Message-ID: <20140719171333.2a67eb5d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sylvain LG,

On Sat, 19 Jul 2014 16:42:55 +0200, Sylvain LG wrote:

> I've just edited cmdline.txt: now I can see all kernel messages in a screen
> session.
> 
> But there is still no console (I mean I can't log in).
> 
> 1 - What should I add to my conf?

Change the getty configuration in "System configuration".

> 2 - I edited directly cmdline.txt on the sdcard since I didn't manage to
> make Buildroot rebuild the system with the new cmdline.txt. How can I do
> that?

No idea, that's a RasberryPi specific stuff, and I haven't done enough
RasberryPi to remember.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
