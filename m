From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 May 2014 22:40:38 +0200
Subject: [Buildroot] [PATCH v2] cmake: disable building of ccmake
In-Reply-To: <1399893576-24505-1-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Mon, 12 May 2014 13:19:36 +0200")
References: <1399893576-24505-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87vbta688p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > To speedup building disable ccmake because it's not needed by buildroot.
 > Also disabling ccmake get rid of the ncurses optional unspecified
 > dependency for the sake of reproducible builds.

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Samuel Martin <s.martin49@gmail.com>
 > Cc: Alexander Potashev <aspotashev@gmail.com>
 > ---

 > v2:
 >  - rebased
 >  - change description

 > Luca because the patch it's changed I was not sure if adding your
 > Reviewed-by and Tested-by tags by myself was ok.

Committed, thanks.

-- 
Bye, Peter Korsgaard
