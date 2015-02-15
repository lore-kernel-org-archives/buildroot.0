From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Feb 2015 21:32:59 +0100
Subject: [Buildroot] [PATCH] package/dvdauthor: fix static build
In-Reply-To: <1423998648-23454-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sun, 15 Feb 2015 12:10:48 +0100")
References: <1423998648-23454-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87pp9aykxw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > Dvdauthor forget to link witk -lbz2 when linking with freetype2.
 > Fixes:
 > http://autobuild.buildroot.net/results/1d8/1d83390a3dd9f6bb595e9fc7b321500b4dc533a8/

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks. Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
