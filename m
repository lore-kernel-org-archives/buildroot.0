From: William Wagner <will_wagner@carallon.com>
Date: Mon, 22 Mar 2010 19:49:42 +0000
Subject: [Buildroot] [Patch]matchbox: convert to autotools
Message-ID: <4BA7C9D6.8060208@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch converts matchbox to use the autotools. In addition it fixes 
buildinf with libxft and fixes building with start-notification

The conversion to autotools meant I split it into a number of sub 
packages so each could be build separately with the autotools 
infrastructure.

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: 0001-matchbox-convert-to-autotools-fix-build-with-start-n.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100322/bde9bd78/attachment-0001.diff>
