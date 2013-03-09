From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Mar 2013 21:22:15 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: fix startup script
In-Reply-To: <1362779609-29725-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 8 Mar 2013 22:53:29 +0100")
References: <1362779609-29725-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87obes1fyg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Obvious fix to the startup script: 'restart' is 'stop+start',
 Yann> not 'stop+stop'.

Committed, thanks.

-- 
Bye, Peter Korsgaard
