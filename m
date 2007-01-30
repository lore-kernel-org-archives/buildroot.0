From: MikeW <mw_phil@yahoo.co.uk>
Date: Tue, 30 Jan 2007 13:46:33 +0000 (UTC)
Subject: [Buildroot] Make too Old--How to upgrade!!!
References: <KLECJOHKIJNMEKLBDEGEAENNCDAA.sunil.ayyapureddy@semindia.in>
	<20070130135557.cf0a40b9.philippe.ney@pardes.ws>
Message-ID: <loom.20070130T144252-993@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe Ney <philippe.ney@...> writes:

> 
> > Hi,All
> > Iam using the buildroot and during make I got an error message, ?Your make
> > is too old 3.79.1. Go get at least 3.80?.
> > How do I upgrade the make of this buildroot package,without tampering with
> > the OS files.Please let me know the solution
> 
> Hello,
> 
> Read the message once again.
> Your make is too old, not the buildroot one.
> 
> Philippe
> 
So, just to be explicit, you need to do something like:

(to check yum operation)
$ yum info make
... which should show make v3.79.1

then
(as root)
# yum update make
... which will update the version, assuming that the first 'info' step was OK

Regards,
MikeW
