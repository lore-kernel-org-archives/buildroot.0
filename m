From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 07:21:59 +0100
Subject: [Buildroot] [PATCH 1/4] package/mpv: fix build with libva 2.0
In-Reply-To: <9vf0jex0pg.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Tue, 16 Jan 2018 06:42:33 +0100")
References: <20171218205609.17653-1-bernd.kuhls@t-online.de>
 <87inc2sr06.fsf@dell.be.48ers.dk>
 <9vf0jex0pg.ln2@ID-313208.user.individual.net>
Message-ID: <87wp0iqq60.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Hi Peter,
 > Am Mon, 15 Jan 2018 23:20:57 +0100 schrieb Peter Korsgaard:

 >> I see that mpv-0.28 (which includes this change) has been released, so
 >> it might be worth bumping the version.

 > this bump is not possible atm, quoting https://github.com/mpv-player/mpv/
 > releases:

 > "This release needs recent FFmpeg (newer than 3.4) due to major 
 > refactoring."

 > Such a ffmpeg version was not released yet, mpv depends on the master 
 > branch of ffmpeg.

Ahh, correct. Thanks.

-- 
Bye, Peter Korsgaard
