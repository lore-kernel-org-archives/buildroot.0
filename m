From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2015 23:37:44 +0100
Subject: [Buildroot] [PATCH] package/flashrom: fix build failures with
	musl
In-Reply-To: <1446069349-27818-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 28 Oct 2015 22:55:49 +0100")
References: <1446069349-27818-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <8737wu7h6v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > flashroms makes a few assumptions on the headers to be included.
 > It forgets that not everything is not using glibc, so it is missing

Double 'not'.

Committed after fixing that, thanks.

-- 
Bye, Peter Korsgaard
