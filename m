From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 31 Jan 2009 14:09:14 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
In-Reply-To: <20090131120242.19B9276219@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sat\, 31 Jan 2009 12\:02\:41 +0000 \(UTC\)")
References: <20090131120242.19B9276219@busybox.osuosl.org>
Message-ID: <87iqnvlj0l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-31 12:02:40 +0000 (Sat, 31 Jan 2009)
 ulf> New Revision: 25176

 ulf> Log:
 ulf> dbus dependencies needs to be ready before ./configure

So now we're back to how it was before you started changing it,
E.G. continous rebuilds.

 ulf> +
 ulf> +dbus-status:
 ulf> +	@echo	BR2_DBUS_EXPAT=$(BR2_DBUS_EXPAT)
 ulf> +	@echo	DBUS_XML=$(DBUS_XML)
 ulf> +	@echo	DBUS_XML_DEP=$(DBUS_XML_DEP)

Please don't add all those debugging foo-status.

-- 
Bye, Peter Korsgaard
