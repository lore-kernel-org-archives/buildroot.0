From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Jul 2020 18:08:34 +0200
Subject: [Buildroot] [PATCH] package/exiv2: fix compiler flags detection
In-Reply-To: <20200719161721.GW18825@scaer>
References: <20200719143404.2542434-1-thomas.petazzoni@bootlin.com>
 <20200719161721.GW18825@scaer>
Message-ID: <20200720180834.25e060bc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Jul 2020 18:17:21 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> You've used TABs in this file that otherwise uses spaces. Hence,
> indentation is off; I've "fixed" that.

Gah, stupid Emacs :-/

> Additionally, the file uses CRLF, so I had to also fix that (not your
> fault, patchowrk is picky about CRLF).

Yes, I knew about CRLF, but I can't do much here, as you say, it's
patchwork that messes up with CRLF line endings.

> Note also that he patch you sent upstream has the same TAB issue,
> causing incorrect rendering of the diff:
>     https://github.com/Exiv2/exiv2/pull/1252/commits/4a76388f7f03e8ec73730292aa6866eda83df4e7

It seems like anyway it is not going to be the variant that will be
applied. The project maintainer is looking for help to resolve this
issue more globally, but oh well it's not as if Buildroot wasn't
keeping me busy enough already!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
