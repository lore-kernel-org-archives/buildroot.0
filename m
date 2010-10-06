From: Daniele Salvatore Albano - Lavoro <info@daccii.it>
Date: Wed, 06 Oct 2010 22:31:28 +0200
Subject: [Buildroot] nptl depends on uclibc
Message-ID: <4CACDCA0.1040103@daccii.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi,

i'm trying to setup a development system using ct-ng with eglibc but, 
while configuring stuff, i've seen that only linuxthreads and 
linuxthreads old are usable and not nptl.

Looking at configuration file i've seen that there is a depends on 
uclibc snapshot.

Is this correct? NPTL should be default, or, however, should be 
selectable when using eglibc and when using glibc.

Thank you,

Best Regards,
Daniele

-- 
Daniele Salvatore Albano
Consulente Informatico
http://www.daccii.it

Servizi:
- Sviluppo di software di rete e standalone in C# e siti web PHP;
- Realizzazione di sistemi embedded con Buildroot;
- Realizzazione di CD di installazione di Ubuntu/Debian personalizzati;
- Installazione e Amministrazione sistemi basati su Debian, Ubuntu, CentOS e Fedora.
