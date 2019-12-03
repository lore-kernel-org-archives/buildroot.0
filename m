From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Dec 2019 14:54:44 +0100
Subject: [Buildroot] [PATCH] system: allow not setting a default,
 system-wide time zone
In-Reply-To: <20191116091004.23726-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 16 Nov 2019 10:10:04 +0100")
References: <20191116091004.23726-1-yann.morin.1998@free.fr>
Message-ID: <878sntms4b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > It is valid that there is no system-wide default time zone defined, in
 > which case Etc/UTC is assumed.

 > Fixes: #12316

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Martin Bark <martin@barkynet.com>
 > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
 > Cc: Richard Braun <rbraun@sceen.net>
 > Cc: Andrew Trapani <andrew.trapani@ontera.bio>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
