From: Ossy <ossy1980@gmx.net>
Date: Sun, 09 May 2010 22:18:39 +0200
Subject: [Buildroot] u-boot failed for arm926t using the rc1 plus patches
	until May 8th
Message-ID: <4BE7189F.9000500@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear buildroot mailinglist,

I tried to use th U-Boot integration of buildroot, but it failed with 
the following out put: "...no rule to make target integrator926_config. 
Stop..."

...
--sysroot=/home/ossy/buildroot/buildroot-dev/output/staging/"	\
		 \
		/usr/bin/make -j1 -C 
/home/ossy/buildroot/buildroot-dev/output/build/u-boot-2010.03	\
		integrator926_config
make[1]: Entering directory 
`/home/ossy/buildroot/buildroot-dev/output/build/u-boot-2010.03'
make[1]: *** Keine Regel, um ??integrator926_config?? zu erstellen. 
Schluss.
make[1]: Leaving directory 
`/home/ossy/buildroot/buildroot-dev/output/build/u-boot-2010.03'
make: *** 
[/home/ossy/buildroot/buildroot-dev/output/build/u-boot-2010.03/.configured] 
Fehler 2
...

Please find attached my configuration.
I am using an amd64 host with lenny to compile for target arm.

I skipped the compilation of u-boot and used an external one.

Kind regards,
Marcus
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: uboot-failed.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100509/2de7dc8e/attachment-0001.txt>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100509/2de7dc8e/attachment-0001.diff>
