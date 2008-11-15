From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Nov 2008 22:33:08 +0100
Subject: [Buildroot] [PATCH 1/2] package/audio: rename audio category to
	multimedia
In-Reply-To: <200811152206.05850.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Sat\, 15 Nov 2008 22\:06\:05 +0100")
References: <200811152206.05850.markus.heidelberg@web.de>
Message-ID: <87zlk0d697.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 Markus> Prepare for the merge of audio and video packages. Many packages cannot
 Markus> properly be assigned to either audio or video, because they have support
 Markus> for both (libogg, mplayer, vlc).

Thanks, committed.

-- 
Bye, Peter Korsgaard
