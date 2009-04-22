From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Apr 2009 16:34:23 +0200
Subject: [Buildroot] [PATCH] Add host-libglib2 dependencie to dbus-glib
In-Reply-To: <49EF2669.7010607@eclis.ch> (Jean-Christian de Rivaz's message of
	"Wed\, 22 Apr 2009 16\:15\:05 +0200")
References: <49CB469A.5080404@eclis.ch>
	<20090422124829.GA28316@cbg.dyndns.org> <1240404749.7072.1.camel@sven>
	<49EF2669.7010607@eclis.ch>
Message-ID: <87zle8oiz4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Christian" == Jean-Christian de Rivaz <jc@eclis.ch> writes:

 >> We are using libxml2, so I can't tell for sure if compiling dbus with
 >> expat is working or not. But it looks as if the dependencies are
 >> correct.

 Jean-Christian> Interesting. On ARM I can only build dbus with expat.

 Jean-Christian> BR2_PACKAGE_DBUS=y
 Jean-Christian> BR2_DBUS_EXPAT=y
 Jean-Christian> # BR2_DBUS_LIBXML2 is not set
 Jean-Christian> BR2_PACKAGE_DBUS_GLIB=y

What happens when you try building it with libxml2? I fixed a build
issue with libxml2 in February.

-- 
Bye, Peter Korsgaard
