From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jan 2013 20:36:29 +0100
Subject: [Buildroot] [PATCH][poke] BR2_PREFER_STATIC_LIB and LDFLAGS+=
	-static
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C610BB3983@ex-mb1.corp.adtran.com>
 (ANDY KENNEDY's message of "Mon, 14 Jan 2013 18:51:51 +0000")
References: <F9C551623D2CBB4C9488801D14F864C628A986@ex-mb1.corp.adtran.com>
 <F9C551623D2CBB4C9488801D14F864C610BB3983@ex-mb1.corp.adtran.com>
Message-ID: <87vcazr1z6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ANDY" == ANDY KENNEDY <ANDY.KENNEDY@adtran.com> writes:

 ANDY> All,
 ANDY> I just pulled the latest snapshot (buildroot-20130114.tar.bz2), did a
 ANDY> quick grep to see if the patch was applied:

 ANDY> buildroot/package# grep static *
 ANDY> Makefile.in:SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
 ANDY> Makefile.in:TARGET_LDFLAGS += -static
 ANDY> Makefile.in:SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
 ANDY> pkg-autotools.mk:               --enable-shared --disable-static \

 ANDY> and see that it wasn't.  Is it on anyone's tree right now or did it
 ANDY> get lost in the shuffle?

Committed now with Arnout's explanation about why it is needed. Please
consider documenting WHY a change is needed rather than just what the
change is to get this kind of patches merged faster in the future.

-- 
Bye, Peter Korsgaard
