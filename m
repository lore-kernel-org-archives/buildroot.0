From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 01 Apr 2018 15:15:29 +0200
Subject: [Buildroot] [PATCH 1/3] package/mplayer: disable inline sse on
 i386
References: <20170513150918.25427-1-bernd.kuhls@t-online.de>
 <20170514160855.2dea324b@free-electrons.com>
 <XnsA776E64284194berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <5b884a7c-9147-12e0-e6e7-c6f71d82f089@mind.be>
 <87woxrruhf.fsf@dell.be.48ers.dk>
Message-ID: <hk27pexo6d.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 01 Apr 2018 14:17:48 +0200 schrieb Peter Korsgaard:

> Or alternatively drop mplayer now that we have mpv. Mplayer upstream
> seems pretty dead with no releases in the last two years.

Hi Peter,

no objections, and I have no interest in fixing the ffmpeg code in 
mplayer. The only package selecting mplayer (as runtime dependency) is 
tovid, we need to handle that as well.
The libplayer package only has an optional dependency to mplayer, its 
option BR2_PACKAGE_LIBPLAYER_MPLAYER would need legacy handling.

Shall I send patches to remove mplayer?

Regards, Bernd
