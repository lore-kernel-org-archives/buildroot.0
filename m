From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Aug 2013 12:15:46 +0200
Subject: [Buildroot] [PATCH] mesa3d: fix download URL
In-Reply-To: <1377768573-7488-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Thu, 29 Aug 2013 11:29:33 +0200")
References: <1377768573-7488-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87vc2og5v1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> The MesaLib 7.10.3 tarball has been moved on ftp.freedesktop.org
 Luca> from pub/mesa/7.10.3/ to pub/mesa/old_versions/7.x/7.10.3/.  A
 Luca> bump to a newer release is only coming after Buildroot 2013.08,
 Luca> so for now let us just change URL to let the download work
 Luca> properly.

 Luca> Reported-by: Ryan Wilkins <ryan@deadfrog.net>
 Luca> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
