From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 09:35:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/libupnp18: needs host-pkgconf
In-Reply-To: <20190509110438.31340-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Thu, 9 May 2019 13:04:37 +0200")
References: <20190509110438.31340-1-joerg.krause@embedded.rocks>
Message-ID: <87r287upxl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Otherwise build fails with:
 > ```
 > configure.ac:630: error: possibly undefined macro: AC_MSG_ERROR
 >       If this token and others are legitimate, please use m4_pattern_allow.
 > ```

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
