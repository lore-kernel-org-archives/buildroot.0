From: Davis Mcpherson <davis.mcpherson@gmail.com>
Date: Tue, 25 Jan 2011 18:44:58 -0500
Subject: [Buildroot] Can Buildroot be configured to use the ELDK toolchain
	as an External Toolchain?
Message-ID: <2B25428B-FDE1-4E48-A13D-45B6B7E9706B@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I'm working on a project that is using the ELDK toolchain and would like to use these tools to build Buildroot, I followed the instructions to configure an external toolchain via 'make menuconfig' but when I do 'make' i get an error that the the c library has been specified, i'm using glibc

but I think the problem is rooted in the SYSROOT value being used to verify glibc...

has anyone configured Buildroot to use ELDK as the external toolchain to use for builds? 

thanks,

davis mcpherson
