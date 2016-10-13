From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 23:54:16 +0200
Subject: [Buildroot] [PATCH v3,1/1] motion: new package
In-Reply-To: <1475012267-68264-1-git-send-email-fabrice.fontaine@orange.com>
 (Fabrice Fontaine's message of "Tue, 27 Sep 2016 23:37:47 +0200")
References: <1475012267-68264-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <87mvi7gbjr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Motion is a program that monitors the video signal from
 > cameras. It is able to detect if a significant part of
 > the picture has changed; in other words, it can detect motion.

 > libv4l has to be selected to be able to use a local camera.

What does this mean? I don't seem to find any handling of libv4l? (only
the kernel api).

 > https://motion-project.github.io

 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
 > ---
 > Changes v2 -> v3 (after review of Arnout Vandecappelle):
 >  - Add a comment before MOTION_AUTORECONF
 >  - Fix application of second patch (use += instead of =)
 >  - Remove spurious end-of-line after ffmpeg dependency
 >  - Add --with-ffmpeg, --with-mysql, --with-mypostgresql and
 >    --with-sqlite3 when needed
 >  - Put mysql and postgresql assignements into a single MOTION_CONF_OPTS
 >  - Add Reviewed-by header

Committed, thanks.

-- 
Bye, Peter Korsgaard
