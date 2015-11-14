From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2015 23:31:41 +0100
Subject: [Buildroot] [PATCH] package/fastd: propagate libcap dependency
In-Reply-To: <1447539706-15504-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 14 Nov 2015 23:21:46 +0100")
References: <1447539706-15504-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87vb94gqlu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > libcap neds headers >= 3.0, so propagate that down to fastd which
 > selects libcap.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Alexander Dahl <post@lespocky.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
