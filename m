From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Jun 2017 16:47:51 +0200
Subject: [Buildroot] [PATCH] iperf: fix tarball hashes changed upstream
In-Reply-To: <1498018018-22680-1-git-send-email-post@lespocky.de> (Alexander
 Dahl's message of "Wed, 21 Jun 2017 06:06:58 +0200")
References: <1498018018-22680-1-git-send-email-post@lespocky.de>
Message-ID: <87h8z9jt2g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Dahl <post@lespocky.de> writes:

 > Upstream uploaded a new tarball with the same version number 2016-09-08,
 > some time after the update to v2.0.9 in buildroot. Someone noticed, but
 > upstream set the ticket to wontfix, and promised to do better in the
 > future: https://sourceforge.net/p/iperf2/tickets/20/

 > Signed-off-by: Alexander Dahl <post@lespocky.de>
 > ---
 > According to y_morin on IRC you may want to change or remove the tarball
 > on source.buildroot.org then.

FYI, I've updated the tarball on s.b.o.

-- 
Bye, Peter Korsgaard
