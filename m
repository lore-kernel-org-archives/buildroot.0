From: Jason Valenzuela <jvalenzuela@dspfl.com>
Date: Mon, 19 May 2008 18:24:32 -0400
Subject: [Buildroot] Bootloaders
Message-ID: <4831FE20.6050508@dspfl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trying to get my first root fs ready to boot and I can't seem to get any 
of the bootloaders to compile.

Grub complains about not finding a specific patch on the debian ftp site.

syslinux complains while building to the tune of
"as: option '-alternate' doesn't allow an argument." This is the 'as' 
that is provided in my default i486 slackware host system.

U-boot dies with *** No rule to make target `_config'.

pxelinux I haven't tried as my target host isn't going to be on a network.

Am I missing something stupid?

Thanks,
Jason Valenzuela
