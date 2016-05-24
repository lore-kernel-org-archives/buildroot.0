From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 22:12:40 +0200
Subject: [Buildroot] [PATCH] package/skeleton: fix message about
	non-merged custom skeleton
In-Reply-To: <1464120129-29232-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 24 May 2016 22:02:09 +0200")
References: <1464120129-29232-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87y46z9pvr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Use of a merged /usr is not restricted to systemd anymore, thus the
 > current error message is misleading, as it only speaks about systemd.

 > Fix the message by just ditching the reference to systemd altogether.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
