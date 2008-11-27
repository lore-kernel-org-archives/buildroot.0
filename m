From: SalvoFa <salvatore.fassi@gmail.com>
Date: Thu, 27 Nov 2008 05:54:40 -0800 (PST)
Subject: [Buildroot]  Initramfs question
Message-ID: <20719678.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

I'm currently using buildroot to generate a cramfs filesystem.
Now I've the need to create also an initramfs that will mount the real
cramfs filesystem.
This initramfs will be more or less the same as the ones used by Ubuntu...so
it will check the kernel command line and will mount the right filesystem
from the desired device.
I know that in buildroot there is the possibility to create the initramfs.
"make initramfs" will create a file list and then the kernel will create the
gzipped cpio archive. But this means that it takes the file list from the
project compiled root filesystem...but I want the initramfs to be a
different filesystem..as it should be...
Must I create another "project" in my buildroot directory for my custom
initramfs?

Thank you for your help.

Salvo
-- 
View this message in context: http://www.nabble.com/Initramfs-question-tp20719678p20719678.html
Sent from the BuildRoot mailing list archive at Nabble.com.
