From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 23:34:54 +0200
Subject: [Buildroot] [PATCH 1/1] mpd: remove version 0.19
In-Reply-To: <20170913205436.10052-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Wed, 13 Sep 2017 22:54:36 +0200")
References: <20170913205436.10052-1-joerg.krause@embedded.rocks>
Message-ID: <87efqyo1s1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > MPD version 0.20 is affected by GCC bug 64735 and failes to build for
 > some archictuctures (NIOSII, ARMv4, ARMv5 and SPARCv8) with a GCC
 > toolchain less then version 7.

 > We added a version choice between 0.19 and 0.20 in Buildroot version
 > 2017.02 as GCC 7 was not yet available at that time. This way, mpd could
 > still be build for those architectures.

 > As GCC 7 is now available in Buildroot remove the version choice for 0.19.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
