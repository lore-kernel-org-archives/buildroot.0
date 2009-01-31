From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 31 Jan 2009 10:43:58 +0100
Subject: [Buildroot] dbus no longer builds
Message-ID: <1233395038.4147.110.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With your fix, dbus no longer builds for
* at91rm9200df
* at91sam9260dfc
* at91sam9g20dfc

Please fix your patch so that it works.

checking for ISO C99 varargs macros in C... yes
checking for GNUC varargs macros... yes
checking for struct cmsgcred... no
checking for getpeerucred... no
checking for getpeereid... no
checking abstract socket namespace... (cached) yes
checking for XML_ParserCreate_MM in -lexpat... no
checking for libxml-2.0 >= 2.6.0... configure: error: Explicitly
requested expat but expat not found
make: ***
[/home/ulf/projects/Buildroot/20090129/at91rm9200df/build_arm/dbus-1.1.1/.configured] Fel 1


BR
Ulf Samuelsson
