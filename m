From: Paulo Silva(OpenSoftware) <psilva@opensoftware-br.com>
Date: Sun, 22 May 2011 15:32:22 -0300
Subject: [Buildroot] buildroot and the at91sam9261ek.
Message-ID: <4DD956B6.4010907@opensoftware-br.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am new to buildroot, but the tool is so easy that I had compiled all 
things and I can:
* run the bootstrap that calls u-boot
* run u-boot that calls kernel.
* run kernel that stop because it does not have a rootfile system.

I configured the buildroot to generate initramfs, but instead to attach 
it to a kernel end it put the the initramfs file in /usr directory.

So I ask you, how to put the initramfs into kernel file end?

cheers

Paulo Carvalho
