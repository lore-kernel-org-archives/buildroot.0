From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Jul 2020 10:03:10 +0200
Subject: [Buildroot] local autobuild failures
In-Reply-To: <CAEyMn7bJ54kxuP0LGAJ0sCZGokx7cAoQrsiQhuafBw0kJeFbHA@mail.gmail.com>
References: <CAEyMn7YeeODW9bKxQYY1oXotvyNG+QX41kbGhmrHKiqOsd0hdQ@mail.gmail.com>
 <20200718141049.115c1bb0@windsurf.home>
 <CAEyMn7bJ54kxuP0LGAJ0sCZGokx7cAoQrsiQhuafBw0kJeFbHA@mail.gmail.com>
Message-ID: <20200719100310.284d3f0f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 18 Jul 2020 20:10:08 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> buildroot at USE306VV1C:/srv/storage/autobuild/run$ locale -a
> C
> C.UTF-8
> POSIX
> 
> local seems to be ok. Any other suggestions?

Could you try adding a non-C UTF-8 locale, en_US.UTF-8, or something
like that, and see what happens ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
