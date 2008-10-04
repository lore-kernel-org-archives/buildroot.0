From: Micha Nelissen <micha@neli.hopto.org>
Date: Sat, 04 Oct 2008 21:45:33 +0200
Subject: [Buildroot] [PATCH] libgtk2 must not install docs to target
Message-ID: <gc8h9d$eil$6@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here is a patch to not install docs/demos to target. Also do not use 
libjasper (needed when going to 2.14 IIRC).

Micha
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: libgtk2.diff
Url: http://busybox.net/lists/buildroot/attachments/20081004/be61b4f0/attachment.txt 
