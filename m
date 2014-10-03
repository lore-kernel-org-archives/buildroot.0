From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 03 Oct 2014 14:32:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/dovecot: New package
References: <1411925137-11284-1-git-send-email-bernd.kuhls@t-online.de>
 <20140929191314.36b87a70@free-electrons.com>
 <XnsA3BB7588C35A8berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20141003134024.4de4020b@free-electrons.com>
Message-ID: <XnsA3BB93E13C821berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20141003134024.4de4020b at free-electrons.com:

> Regarding LGPLv2.1 vs. LGPLv2.1+ it's not written in the license text
> (the license text is just one particular version), but in the header of
> each source file, where you have a "(or later)" specification if it's
> with "+", or no such specification when it's just one particular
> version that applies.

Hi,

http://hg.dovecot.org/dovecot-2.2/file/tip/src/master/main.c, among many 
others, contains

/* Copyright (c) 2005-2014 Dovecot authors, see the included COPYING file */

Imho it is therefore save to assume that Dovecot is licensed by LGPLv2.1: 

http://hg.dovecot.org/dovecot-2.2/file/tip/COPYING

"Everything else is LGPLv2.1 (see COPYING.LGPL) unless otherwise mentioned at 
the beginning of the file."

Regards, Bernd
