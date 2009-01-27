From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 27 Jan 2009 13:06:21 +0000
Subject: [Buildroot] PATCH: linuxthreads and arm compile fix
Message-ID: <497F06CD.3040203@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doing a default config with linuxthreads and arm fails to compile due to missing headers. 
The attached patch adds the headers. After applying this patch it all seems to work.

Will.
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: uClibc-0.9.30-arm_linuxthreads.patch
Url: http://lists.busybox.net/pipermail/buildroot/attachments/20090127/cd98235a/attachment.diff 
