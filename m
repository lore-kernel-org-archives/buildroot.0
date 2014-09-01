From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 01 Sep 2014 13:20:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnl: add patch to fix build
	with the musl C library
In-Reply-To: <1409567348-18757-1-git-send-email-jkrause@posteo.de>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Mon, 1 Sep 2014 12:29:08 +0200")
References: <1409567348-18757-1-git-send-email-jkrause@posteo.de>
Message-ID: <87sikblh8g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:

 > Add a patch to the package libnl which removes an error when building
 > libnl against the musl C library.

 > Signed-off-by: J?rg Krause <jkrause@posteo.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
