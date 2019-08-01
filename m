From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 20:21:46 +0200
Subject: [Buildroot] [PATCH 1/2 v7] package/iputils: drop setuid on
 arping
In-Reply-To: <f9b8b678e88316d6b572dc87e5080896cd8a84c7.1564676540.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 1 Aug 2019 18:22:32 +0200")
References: <cover.1564676540.git.yann.morin.1998@free.fr>
 <f9b8b678e88316d6b572dc87e5080896cd8a84c7.1564676540.git.yann.morin.1998@free.fr>
Message-ID: <87a7csvj9h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > arping can be used for arp poisoning, so it should really not be setuid.
 > Reported-by: Petr Vorel <petr.vorel@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
