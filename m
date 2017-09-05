From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 00:00:01 +0200
Subject: [Buildroot] [PATCH] package/valgrind: hide comment when arch is
	not supported
In-Reply-To: <20170810215111.32360-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 10 Aug 2017 23:51:11 +0200")
References: <20170810215111.32360-1-yann.morin.1998@free.fr>
Message-ID: <87d174kdr2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, the comment that "valgrind needs shared libs" is not hidden
 > when the architecture dependencies are not met, which can confuse some
 > users (as recently seen on IRC).

 > Fix that by introducing the traditional _ARCH_SUPPORTS option, and have
 > the comment and the symbol depend on that.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Brandon Maier <brandon.maier@rockwellcollins.com>
 > Cc: J?r?me Pouiller <jezz@sysmic.org>
 > Cc: Peter Seiderer <ps.report@gmx.net>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

 > ---
 > Note: Cc-ing the people that have touched valgrind in the past 12
 > months-or-so...

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
