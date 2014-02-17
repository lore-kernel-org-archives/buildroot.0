From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Feb 2014 09:02:26 +0100
Subject: [Buildroot] [PATCH 1/2] vlc: explicitly disable opencv support
In-Reply-To: <1392502403-19701-2-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 15 Feb 2014 23:13:22 +0100")
References: <1392502403-19701-1-git-send-email-s.martin49@gmail.com>
 <1392502403-19701-2-git-send-email-s.martin49@gmail.com>
Message-ID: <87fvnii2ul.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > vlc can use opencv in video filters, but it requires a couple of
 > features enabled in opencv; so, simply force disabling opencv support.

 > Note that vlc does includes the legacy opencv/cv.h header, which pulls a
 > number of opencv's features (core, video, imgproc, ...).

 > Fixes:
 >   http://autobuild.buildroot.org/results/39c/39c77ffb5a5599d0b09422433c747b2bac185c4f/
 >   http://autobuild.buildroot.org/results/a79/a79b055da09e4d8ede263251df8461bc8a64569a/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
