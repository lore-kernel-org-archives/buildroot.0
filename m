From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 02 Oct 2009 13:17:14 +0200
Subject: [Buildroot] [git commit master] directfb: fix build with
	BR2_PACKAGE_DIRECTFB_DEBUG
In-Reply-To: <1254481962.3924.10.camel@sven> (Sven Neumann's message of "Fri\,
	02 Oct 2009 13\:12\:42 +0200")
References: <20091002105811.23BFE77762@busybox.osuosl.org>
	<1254481962.3924.10.camel@sven>
Message-ID: <87eipm6o5h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 >> +Commit fdc611ea (Added support for colors and multiple layers in a
 >> +glyph implementing outlines) changed dfb_gfxcard_drawglyph() to take
 >> +a layers argument instead of index, but the D_DEBUG_AT call wasn't
 >> +changed to match.

 Sven> It that patch upstream already? Otherwise I can take care of that.

I  sent it to dok and directfb-dev earlier today, but I don't see it in
the archive - Maybe it's stuck in moderation (I'm not subscribed).

-- 
Bye, Peter Korsgaard
