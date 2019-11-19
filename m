From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 10:33:45 +0100
Subject: [Buildroot] [PATCH 3/3] package/kodi: add missing host-gettext
 dependency
In-Reply-To: <9a12e61152e7f9944e986aa9f1c7483750e767c2.1573759321.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 14 Nov 2019 20:22:10 +0100")
References: <cover.1573759321.git.yann.morin.1998@free.fr>
 <9a12e61152e7f9944e986aa9f1c7483750e767c2.1573759321.git.yann.morin.1998@free.fr>
Message-ID: <87mucsnrba.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > A sub-component of Kodi (cpluff) needs to be autoreconf-ed, and uses
 > gettext, so calls to autopoint.

 > Add a dependency to host-gettext to bring an appropriate variant that
 > provides autotpoint (gettext-tiny's autopoint works like a charm, for
 > the curious).

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
