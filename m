From: Daniele Salvatore Albano - Lavoro <info@daccii.it>
Date: Thu, 07 Oct 2010 00:19:48 +0200
Subject: [Buildroot] fakeroot fails to compile using crosstools-ng toolchain
Message-ID: <4CACF604.4080403@daccii.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi,

i got a strange error, related to largefile support i think, when i 
compile fakeroot. Large file support is enabled either on crosstools-ng 
and either on buildroot.

Everything else compiled fine (i got an error related to gdb host 
package related to a symlink and an error with dnsmask related to 
libidn, but these aren't related to the fakeroot problem)

Here i posted the fakeroot compilation log
http://pastebin.com/8i8CbdMu

Here buildroot config file and crosstools-ng config file
http://pastebin.com/5tJYGqu4
http://pastebin.com/Mm8hTKVg


I'm using buildroot from git repository and ct-ng 1.8.0 (br support that 
version)

Any suggestions?


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
