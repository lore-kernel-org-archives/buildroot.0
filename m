From: William Wagner <will_wagner@carallon.com>
Date: Thu, 28 Jan 2010 18:09:01 +0000
Subject: [Buildroot] uClibc copying kernel headers
In-Reply-To: <4B608C1A.70901@carallon.com>
References: <4B608C1A.70901@carallon.com>
Message-ID: <4B61D2BD.4050603@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Have tested out this patch on a couple of configs and it all seems to 
work fine.

Patch just switches behaviour to 2.6.x kernels back to way it used to be

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: 0011-Fix-for-improper-copying-of-kernel-headers.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100128/132983d2/attachment.diff>
