From: Arnon Meydav <ArnonM@metalinkBB.com>
Date: Mon, 30 Apr 2007 13:48:15 +0300
Subject: [Buildroot] Error trying to compile linux kernel
Message-ID: <5002BD9FB045734DB9F20119530FB01701173046@ilmail2.metalink.dsl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
I am trying to compile the linux kernel for a mips core using buildroot,
and I keep getting the following error.
cp is missing an argument when copying the linux .config file.
 
 
The error dump:
 
/usr/bin/install -D
/home/arnonm/RG/buildroot/toolchain_build_mips_nofpu/module-init-tools-3
.2.2/depmod
/home/arnonm/RG/buildroot/build_mips_nofpu/staging_dir/bin/mips-linux-de
pmod26
cp -dpf
/home/arnonm/RG/buildroot/build_mips_nofpu/linux-2.6.20.4/.config
cp: missing destination file
Try `cp --help' for more information.
make: ***
[/home/arnonm/RG/buildroot/build_mips_nofpu/linux-2.6.20.4/.configured]
Error 1

 
Any suggestions?
 
Thanks, 
- Arnon M


-- Disclaimer: --
This e-mail is intended solely for the person to whom it is addressed and may contain confidential or legally privileged information. Access to this e-mail by anyone else is unauthorized. If an addressing or transmission error has misdirected this e-mail, please notify the author by replying to this e-mail and destroy this e-mail and any attachments. 
E-mail may be susceptible to data corruption, interception, unauthorized amendment, viruses and delays or the consequences thereof. If you are not the intended recipient, be advised that you have received this email in error and that any use, dissemination, forwarding, printing or copying of this email is strictly prohibited.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070430/15cea5e1/attachment.htm 
