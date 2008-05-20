From: Jason Valenzuela <jvalenzuela@dspfl.com>
Date: Tue, 20 May 2008 16:10:44 -0400
Subject: [Buildroot] Bootloaders
In-Reply-To: <326f33790805201145r785b06hcbec87b888ff8a76@mail.gmail.com>
References: <4831FE20.6050508@dspfl.com>	
	<326f33790805191734n68a95ee2m758c4266aeb4d02e@mail.gmail.com>	
	<48330E51.6050505@dspfl.com>	
	<326f33790805201131w57057429ydef6aa0df0bf0ec0@mail.gmail.com>	
	<48331ABD.1060907@dspfl.com>
	<326f33790805201145r785b06hcbec87b888ff8a76@mail.gmail.com>
Message-ID: <48333044.5090301@dspfl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, thanks for the help so far. Got uClibc and grub to build ok.

Some booting issues:

I'm looking to use this to boot from a compact flash. I've partitioned 
and created an ext2 file system on the CF card. I mounted this partition 
and untarred the root file system onto the CF. I've copied the kernel 
from binaries/PROJECT_NAME/ to /boot in the CF file system.

Now I'm kind of fuzzy on how to get grub to setup on it. The card shows 
up as /dev/hdc with the only partition being /dev/hdc1, which seems 
fine. If I chroot onto it and run grub, when I try and issue a root 
(hd2,0) I get 'Error 21: Selected disk does not exist'.


Thanks,
Jason Valenzuela
