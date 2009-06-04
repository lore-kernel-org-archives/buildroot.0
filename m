From: Daniele Salvatore Albano <d.albano@gmail.com>
Date: Thu, 4 Jun 2009 09:51:15 +0200
Subject: [Buildroot] Set LIBS variabile using new package format
Message-ID: <159a01660906040051k5dc43776ve49f305dc4841d0a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i'm writing some packages for buildroot, i need them for my little
project. Currently i added packages for clamav, with support for
clamd/clamdscan/freshclam, havp, dansguardiand and tinyproxy. For last
two i used the new package format, looking other packages.

However i've a problem: there is a little bug in the tinyproxy
configure so libintl.h is being reknown but -lintl isin't added to
libraries to link and it fails to link so i need to add it. I've tried
setting up LIBS variable, PACKAGENAME_LIBS variable and more but
nothing to do, it doesn't work. I looked for other packages too but
nothing.

There is a way to set change LIBS or CFLAGS variables? Or is better to
do a little patch to apply to configure.ac and use
PACKAGENAME_AUTORECONF to force to rebuild autoconf?

There are docs about this new format?

Best Regards,
Daniele

-- 
Daniele Salvatore Albano
Consulente Informatico
http://www.phpsoft.it
http://www.dacci.it

Servizi:
- Sviluppo in C# e PHP
- Installazione e Amministrazione sistemi Ubuntu, CentOS e Fedora
