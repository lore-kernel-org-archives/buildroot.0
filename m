From: William Wagner <will_wagner@carallon.com>
Date: Thu, 01 Oct 2009 16:54:48 +0100
Subject: [Buildroot] [***SPAM*** Score: 3.3] problem with locale
Message-ID: <4AC4D0C8.5000109@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Just started moving to latest buildroot dev tree. I have hit an error 
using the attached config, it is a pretty plain x86 config but with 
locale support.

It fails to build uClibc with this error:
    LN include/sys/vm86.h
    HOSTCC extra/locale/gen_wc8bit
extra/locale/gen_wc8bit.c: In function 'main':
extra/locale/gen_wc8bit.c:356: warning: array subscript is above array
bounds
extra/locale/gen_wc8bit.c:415: warning: array subscript is above array
bounds
extra/locale/gen_wc8bit.c:481: warning: array subscript is above array
bounds
    GEN extra/locale/codesets.txt
    GEN extra/locale/c8tables.h
setlocale(LC_CTYPE,"en_US.UTF-8") failed!
make[1]: *** [extra/locale/c8tables.h] Error 1
make[1]: Leaving directory
`/home/willw/buildroot/output/toolchain/uClibc-0.9.30.1'
make: ***
[/home/willw/buildroot/output/toolchain/uClibc-0.9.30.1/.configured]
Error 2

I vaguely remember seeing something on the mailing list previously but I 
have not been able to find it.

Any help much appreciated.

Will.

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------


-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 19179 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091001/8e591ef9/attachment.xml>
