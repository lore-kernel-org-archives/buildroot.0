From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Nov 2014 23:49:31 +0100
Subject: [Buildroot] [PATCH] package/libwebsockets: fix static build
In-Reply-To: <1417347854-27983-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 30 Nov 2014 12:44:14 +0100")
References: <1417347854-27983-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87tx1gi9s4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When the version was bumped, the existing patch to fix static linking
 > was not proprerly tested, and was missing three new locations to be
 > fixed.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Sagaert Johan <sagaert.johan@skynet.be>
 > Cc: Samuel Martin <s.martin49@gmail.com>
 > Cc: Baruch Siach <baruch@tkos.co.il>

 > ---
 > Changes v1 -> v2:
 >   - remove spurious hunk
 >   - fix typoes  (Baruch, Samuel)

Committed with autobuild references added, thanks.

-- 
Bye, Peter Korsgaard
