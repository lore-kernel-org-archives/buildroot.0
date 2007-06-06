From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 6 Jun 2007 14:18:14 +0000 (UTC)
Subject: [Buildroot] Problem with fakeroot package - 1.6.5 gone
References: <4608E16F.6020608@kh3.org>
Message-ID: <loom.20070606T161128-424@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Francois Visconte <fv@...> writes:

> 
> Hello,
> 
> Fakeroot in it's version 1.6.4 is no longer on the debian mirrors.
> I updated VERSION to 1.6.5 and it works (no problem about 
> fakeroot-doc.patch patch)
> 
> Cheers,
> Fran?ois Visconte

Version 1.6.5 has now gone too - can we have the version
as a menuconfig option please, it shouldn't require a patch
every time Debian decides to tidy its files.

Currently the version number is hardcoded with := into the .mk file,
if it was set using a ?= it would at least be overridable.

Regards,
MikeW
