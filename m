From: Robert B. Williams <rwilliams@valcom.com>
Date: Mon, 24 Nov 2008 16:12:46 -0500
Subject: [Buildroot] PHP fails to compile, LC_CTYPE undeclared
Message-ID: <492B18CE.3050109@valcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am sure there is an easy answer to this.  PHP fails to compile with 
LC_TYPE undeclared.

I pretty much built everything with the defaults except:
i586
gettext/locale/
large files
wchar
php

I built buildroot successfully prior to without php.  So I am assuming 
that LC_CTYPE is hiding in a package or toolchain somewhere.  What do I 
need to turn on?

Thanks in advance.
