From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 22 Jan 2009 20:07:33 +0100
Subject: [Buildroot] How handle broken or partly broken packages in the
	distribution
Message-ID: <1232651253.5311.19.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following packages will not build for the AVR32
since it is not supported as an architecture.
or dependencies cause the same problem:

bberkeleydb
kexec
libevent
ltrace
argus
bind
kismet
libeXosip2
ntpd
openvpn
stunnel
vtun
dbus-glib
dmraid
hal
ntfs-3g
smartmontools
ruby
xerces


I suggest we disable them using
	depends on "BR2_avr32

so they are not selectable for AVR32 users

BR
Ulf Samuelsson
