From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 31 Jan 2009 13:31:31 +0100
Subject: [Buildroot] dbus no longer builds
In-Reply-To: <1233395038.4147.110.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Sat\, 31 Jan 2009 10\:43\:58 +0100")
References: <1233395038.4147.110.camel@elrond.atmel.com>
Message-ID: <87tz7flkrg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> With your fix, dbus no longer builds for
 Ulf> * at91rm9200df
 Ulf> * at91sam9260dfc
 Ulf> * at91sam9g20dfc

 Ulf> Please fix your patch so that it works.

 Ulf> checking for ISO C99 varargs macros in C... yes
 Ulf> checking for GNUC varargs macros... yes
 Ulf> checking for struct cmsgcred... no
 Ulf> checking for getpeerucred... no
 Ulf> checking for getpeereid... no
 Ulf> checking abstract socket namespace... (cached) yes
 Ulf> checking for XML_ParserCreate_MM in -lexpat... no
 Ulf> checking for libxml-2.0 >= 2.6.0... configure: error: Explicitly
 Ulf> requested expat but expat not found
 Ulf> make: ***
 Ulf> [/home/ulf/projects/Buildroot/20090129/at91rm9200df/build_arm/dbus-1.1.1/.configured] Fel 1

Strange, it builds just fine here (i686). Are you saying that expat
doesn't build before dbus?

-- 
Bye, Peter Korsgaard
