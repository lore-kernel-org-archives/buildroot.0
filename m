From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 16 Apr 2009 17:33:34 +0100
Subject: [Buildroot] tslib broken
Message-ID: <49E75DDE.60605@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Seems like tslib has got broken when it was converted to use autotools, it has lost a 
couple of the customisations needed.

Attached is my patch that works as it did before. Note this patch deliberately removes a 
couple of the tslib patches as I believe they are wrong - see 
http://lists.busybox.net/pipermail/buildroot/2008-June/021164.html

Will
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: tslib.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090416/52232eaf/attachment.diff>
