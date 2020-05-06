From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 08:00:55 +0200
Subject: [Buildroot] [PATCH] packages/exim: enable parallel make
In-Reply-To: <20200420163645.17803-1-luca@lucaceresoli.net> (Luca Ceresoli's
 message of "Mon, 20 Apr 2020 18:36:45 +0200")
References: <20200420163645.17803-1-luca@lucaceresoli.net>
Message-ID: <87wo5pbo14.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Parallel make used to be broken in exim, as reported in its docs. Now that
 > line has disappeared from the docs, and parallel make is actually working.

 > Tested with 'make exim-dirclean ; time make BR2_JLEVEL=999 exim': builds
 > still succeed and the build time decreases from 34 to 11 seconds on my
 > host.

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
