From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 May 2014 22:32:21 +0200
Subject: [Buildroot] [PATCH 1/2] flite: depend on alsa-lib when available
In-Reply-To: <fe00d46b244bd6b6023e6a8f87307b136938cf70.1398914248.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 1 May 2014 06:17:27 +0300")
References: <fe00d46b244bd6b6023e6a8f87307b136938cf70.1398914248.git.baruch@tkos.co.il>
Message-ID: <8738gqmwmi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The flite configure script detects the availability of alsa-lib. Add alsa-lib
 > to flite dependencies to make sure alsa-lib is always detected when
 > available.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
