From: rafael2k <rafael@riseup.net>
Date: Thu, 4 Oct 2007 12:01:08 -0300
Subject: [Buildroot] target gcc (x86) fails to compile
Message-ID: <200710041201.11721.rafael@riseup.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi all,
when I chroot to my buildroot generated uclibc system, gcc gives me:

# gcc a.c
lib/libc.so.0: undefined reference to `_dl_app_init_array'
/lib/libc.so.0: undefined reference to `_dl_app_fini_array'
collect2: ld returned 1 exit status

I'm using uclibc 0.9.29.

Am I doing anything wrong?

thanks!
rafael diniz

-- 
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
Ci?ncia da Computa??o @  Unicamp
R?dio Muda, radiolivre.org, TV Piolho, tvlivre.org, www.midiaindependente.org
Chave PGP: http://pgp.mit.edu:11371/pks/lookup?op=get&search=0x2FF86098
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part.
Url : http://busybox.net/lists/buildroot/attachments/20071004/0a9af75d/attachment.pgp 
