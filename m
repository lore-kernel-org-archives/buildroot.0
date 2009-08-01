From: Daniele Salvatore Albano <d.albano@gmail.com>
Date: Sat, 1 Aug 2009 17:51:09 +0200
Subject: [Buildroot] Bump LVM2 to 2.02.50 (LVM2.2.02.47.tgz missing on ftp)
Message-ID: <159a01660908010851g4e37e7eyd7059449b9a7e74e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

LVM2.2.02.47.tgz doesn't exists anymore on lvm2 ftp (
ftp://sources.redhat.com/pub/lvm2/ ), there are two new releases:
- LVM2.2.02.49.tgz
- LVM2.2.02.50.tgz

I've updated the patch level to 50 and it's seems to compile fine,
however i haven't tested it yet.

Attached the patch to upgrade the patch level to 50.

Should i open a bug on bugzilla for this?

Thank you!

-- 
Daniele Salvatore Albano
Consulente Informatico
http://www.phpsoft.it
http://www.dacci.it

Servizi:
- Sviluppo in C# e PHP
- Installazione e Amministrazione sistemi Ubuntu, CentOS e Fedora
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Bump-lvm2-to-2.02.50.patch
Type: application/octet-stream
Size: 727 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090801/9f434e2f/attachment.obj>
