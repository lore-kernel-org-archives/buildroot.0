From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Feb 2014 15:16:31 +0100
Subject: [Buildroot] [PATCH] mpd: fix vorbis build failure
In-Reply-To: <1391779485-3831-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 7 Feb 2014 10:24:45 -0300")
References: <1391779485-3831-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ha8b6m9s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Forcibly disable the vorbis encoder support when the vorbis option isn't
 > enabled to avoid autodetection.
 > Said autodetection has a build bug that it won't properly set libvorbis
 > build options when the decoder is disabled. Fixes:
 > http://autobuild.buildroot.net/results/a46/a46b4c97fe126b23a96051a8bf1243a7f4935434/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
