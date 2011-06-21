From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 21 Jun 2011 13:29:32 +0200
Subject: [Buildroot] [PATCH 0/2] Fix build of shared libraries
In-Reply-To: <1308585595-3948-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Mon, 20 Jun 2011 17:59:53 +0200")
References: <1308585595-3948-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87hb7jctib.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> Hi,

 Luca> 009d8fceab4 and 0a5e5534cbf8 broke shared library building for
 Luca> those AUTOTOOLS packaged that override _CONFIGURE_CMDS.

 Luca> According to my grep'ing, the affetced packages should be only ffmpeg and
 Luca> berkeleydb. These two patched fixes them.

 Luca> Please note I only could test ffmpeg, but the change is pretty trivial so
 Luca> hopefully it works for berkeleydb as well.

Good catch - Committed both, thanks!

-- 
Bye, Peter Korsgaard
