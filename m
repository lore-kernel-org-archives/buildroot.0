From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 May 2014 23:04:53 +0200
Subject: [Buildroot] [PATCH 2/2] package/tz: install missing files
In-Reply-To: <c976aa8f37ac787ecec903272d8c5fed7a75b833.1399219226.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 4 May 2014 18:01:28 +0200")
References: <cover.1399219226.git.yann.morin.1998@free.fr>
 <c976aa8f37ac787ecec903272d8c5fed7a75b833.1399219226.git.yann.morin.1998@free.fr>
Message-ID: <8761lljlvu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > As for the tzdata package, install the missing files:
 >   - zone.tab   : {country-code,coordinates,timezone} tuples
 >   - iso3166.tab: {country-code,country} tuples

 > Reported-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
