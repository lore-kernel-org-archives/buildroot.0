From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Feb 2014 23:07:23 +0100
Subject: [Buildroot] [PATCH] lvm2: disable static builds
In-Reply-To: <1392631126-15817-1-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Mon, 17 Feb 2014 10:58:46 +0100")
References: <1392631126-15817-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87mwhmzrhg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > When BR2_PREFER_STATIC_LIB is defined it still try to build the shared
 > executables and it fails.

 > Fixes:
 > http://autobuild.buildroot.net/results/b0b/b0b386969459dda9c294f1ccb4927ca225fa6bdd/

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
