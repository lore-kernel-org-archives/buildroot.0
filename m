From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Jan 2014 22:45:18 +0100
Subject: [Buildroot] [PATCH] lvm2: fix static building when
	BR2_PREFER_STATIC_LIB is used
In-Reply-To: <1390207114-2808-1-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Mon, 20 Jan 2014 09:38:34 +0100")
References: <1390207114-2808-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <8761p5nlox.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > To fix static building:
 > - Add "--enable-static_link" to the configure options.
 > - Because the shared executables don't build with
 >   BR2_PREFER_STATIC_LIB add a patch to disable it.

 > Fixes:
 > http://autobuild.buildroot.net/results/b0b/b0b386969459dda9c294f1ccb4927ca225fa6bdd/

Thanks. Has this patch been submitted upstream?

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
 > ---
 >  ...le-static_link-disable-building-of-shared.patch | 75 ++++++++++++++++++++++


-- 
Bye, Peter Korsgaard
