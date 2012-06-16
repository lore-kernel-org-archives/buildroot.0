From: djames.suhanko <djames.suhanko@gmail.com>
Date: Fri, 15 Jun 2012 21:31:35 -0300
Subject: [Buildroot] Microperl problem
Message-ID: <CAFYZmWjTGGWm22cgHHDqhk6ssYaKKnMjJugnygbDEPZa2wBSOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all!
Friends, doesn't hate  me for this, but I think that this my problem with
locales.
My buildroot isn't finalizing!
 How can  I to fix it? I couldn't find a solution in google. :-(


make[2]: Nothing to be done for `locale_headers'.
make[2]: Nothing to be done for `utils'.
#@install -m 755 ../utils/locale
/media/builder/buildroot-2012.02/output/target/usr/bin/locale
make[1]: Saindo do diret?rio
`/media/builder/buildroot-2012.02/output/toolchain/uClibc-0.9.32.1'
touch -c /media/builder/buildroot-2012.02/output/target/usr/bin/ldd
# we need to build a perl for the host just for Errno.pm
(cd /media/builder/buildroot-2012.02/output/build/perl-5.8.8; \
 chmod a+x ext/util/make_ext; \
 ext/util/make_ext nonxs Errno MAKE="/usr/bin/make" \
 )

Making Errno (nonxs)
ext/util/make_ext: 122: ext/util/make_ext: ../../miniperl: not found
Warning: No Makefile!
make[1]: Entrando no diret?rio
`/media/builder/buildroot-2012.02/output/build/perl-5.8.8/ext/Errno'
make[1]: *** Sem regra para processar o alvo `config'.  Pare.
make[1]: Saindo do diret?rio
`/media/builder/buildroot-2012.02/output/build/perl-5.8.8/ext/Errno'
/usr/bin/make config failed, continuing anyway...
make[1]: Entrando no diret?rio
`/media/builder/buildroot-2012.02/output/build/perl-5.8.8/ext/Errno'
make[1]: *** Sem regra para processar o alvo `all'.  Pare.
make[1]: Saindo do diret?rio
`/media/builder/buildroot-2012.02/output/build/perl-5.8.8/ext/Errno'
make: **
[/media/builder/buildroot-2012.02/output/build/perl-5.8.8/.configured] Erro
2



-- 
Djames Suhanko
LinuxUser 158.760
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120615/25f3a9d4/attachment-0001.html>
