From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 14:17:48 +0200
Subject: [Buildroot] [PATCH 1/3] package/mplayer: disable inline sse on
 i386
In-Reply-To: <5b884a7c-9147-12e0-e6e7-c6f71d82f089@mind.be> (Arnout
 Vandecappelle's message of "Sat, 31 Mar 2018 17:12:50 +0200")
References: <20170513150918.25427-1-bernd.kuhls@t-online.de>
 <20170514160855.2dea324b@free-electrons.com>
 <XnsA776E64284194berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <5b884a7c-9147-12e0-e6e7-c6f71d82f089@mind.be>
Message-ID: <87woxrruhf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  Looking at current mplayer build failures, they seem slightly different than
 > the errors you report in the three patches here.

 >  With all the fixes we need for mplayer's bundled ffmpeg, why don't we just
 > switch to ffmpeg itself? mplayer upstream doesn't seem to advise against it,
 > Debian doesn't use the bundled one, so why not? OK, it will probably be some
 > effort to unbundle it, but I think it's more future-safe that way.

Or alternatively drop mplayer now that we have mpv. Mplayer upstream
seems pretty dead with no releases in the last two years.

-- 
Bye, Peter Korsgaard
