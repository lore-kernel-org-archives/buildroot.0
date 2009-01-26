From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 07:02:48 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
In-Reply-To: <1232926285.2298.54.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Mon\, 26 Jan 2009 00\:31\:25 +0100")
References: <20090125205531.E8C1C76D28@busybox.osuosl.org>
	<87pribdrt4.fsf@macbook.be.48ers.dk>
	<1232926285.2298.54.camel@elrond.atmel.com>
Message-ID: <87fxj6d2pj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 ulf> +DBUS_XML_DEP:=$(DBUS_XML_DEP_LIB)
 >> 
 >> Why the dance with DBUS_XML_DEP_LIB ?
 >> 
 >> Is all of this actually needed? As the toplevel Makefile run
 >> sequentially it seems to me that it would be enough to just add expat
 >> / libxml2 to the dbus: line.

 Ulf> Feel free to optimize and test.

For the 2nd part ok, but WHY did you now just add DBUS_XML_DEP_LIB?

-- 
Bye, Peter Korsgaard
