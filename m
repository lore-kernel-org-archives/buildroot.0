From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Aug 2018 23:13:35 +0200
Subject: [Buildroot] [PATCH] core: drop useless assignements to BISON
 and FLEX
In-Reply-To: <20180818221019.4384-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 19 Aug 2018 00:10:19 +0200")
References: <20180818221019.4384-1-yann.morin.1998@free.fr>
Message-ID: <8736vam54w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > They were added back in 5432f26f0 (Adding Central config.cache options),
 > supposedly to be able to cache the result of configure tests, but they
 > were never, ever referenced anywhere in our code... Besides, we dropped
 > the idea of getting a configure cache long ago now (it does not work)...

 > They are causing spurious error messages on some distros (e.g. Fedora)
 > which use GNU's which (whatever package that comes from), while it is
 > silent on other distros (e.g. Ubuntu) which use debianutils' which.

 > Drop them.

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
