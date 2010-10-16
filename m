From: Daniele Salvatore Albano - Lavoro <info@daccii.it>
Date: Sat, 16 Oct 2010 12:44:58 +0200
Subject: [Buildroot] Stops on missing rules for uclib_target nedded for
	gcc_target
Message-ID: <4CB9822A.3020007@daccii.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi,

i'm trying to compile toolchain for the target using crosstools-ng 
trought buildroot, enabling Development Tools -> native toolchain in the 
target filesystem, but i get the error reported in the subject

Here the compile log
http://pastebin.com/KjBt4NZf

Here ct and br config files
http://pastebin.com/WjF1Zw1V        crosstools-ng
http://pastie.org/1225315                  buildroot

If i drop that options it goes ahead without problem.

Thank you,


Best Regards,
Daniele Salvatore Albano

-- 
Daniele Salvatore Albano
Consulente Informatico
http://www.daccii.it

Servizi:
- Sviluppo di software di rete e standalone in C# e siti web PHP;
- Realizzazione di sistemi embedded con Buildroot;
- Realizzazione di CD di installazione di Ubuntu/Debian personalizzati;
- Installazione e Amministrazione sistemi basati su Debian, Ubuntu, CentOS e Fedora.
