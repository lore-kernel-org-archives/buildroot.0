From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Fri, 14 Nov 2008 08:13:56 +0100
Subject: [Buildroot] [RFC] moving audio and video packages into a new
	category 'multimedia'
Message-ID: <200811140813.57041.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm currently working on some video stuff and would like to put new packages
together with the 'audio' category into a new category 'multimedia'. As far as
I can see currently affected are package/audio, mplayer and vlc. Mplayer and
vlc are in the 'graphics' category, that seems to be a bit odd.

Do you agree? Then I would create a patch.

Markus
