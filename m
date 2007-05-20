From: rafael2k <rafael@riseup.net>
Date: Sun, 20 May 2007 17:08:28 -0300
Subject: [Buildroot] uclibc compilation w/ locale not supported?
Message-ID: <200705201708.30037.rafael@riseup.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi all,
I made a .config for my uclibc 0.9.29, but when i run 'make' inside buildroot, 
it changes my config to:

-UCLIBC_HAS_LOCALE=y
-# UCLIBC_PREGENERATED_LOCALE_DATA is not set
-# UCLIBC_HAS_XLOCALE is not set
+# UCLIBC_HAS_LOCALE is not set


thx,
rafael diniz

-- 
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
Eng. da Computa??o @  Unicamp
R?dio Muda, radiolivre.org, TV Piolho, tvlivre.org, www.midiaindependente.org
Chave PGP: http://pgp.mit.edu:11371/pks/lookup?op=get&search=0x2FF86098
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070520/5a2b5787/attachment.pgp 
