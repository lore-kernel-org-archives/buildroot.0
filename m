From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 2 Jun 2013 12:12:47 -0400
Subject: [Buildroot] Why have legal info for host packages?
Message-ID: <CANxTyt6LO-Q3orQnXGL873wG5z9f3ufiE6YOUNMuBq--8VMzFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was using the outputs from "make legal-info" yesterday as the basis for
our embedded product's licenses web page, and found myself modifying
pkg-generic.mk to exclude host packages from the legal info collection.  So
I was wondering - what is the value in including the legal info of packages
built for the host?

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130602/e9662ccb/attachment.html>
