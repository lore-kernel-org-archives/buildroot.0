From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 Dec 2015 23:43:31 +0100
Subject: [Buildroot] [PATCH] package/kodi: fix fallout after infozip
	rename
In-Reply-To: <1449394133-4017-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 6 Dec 2015 10:28:53 +0100")
References: <1449394133-4017-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87k2orqju4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit f0c9470 (infozip: rename to zip) forgot to propagate the rename
 > down to the only user of the host variant of infozip.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Luca Ceresoli <luca@lucaceresoli.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
