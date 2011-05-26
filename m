From: Paulo Carvalho Silva <psilva@opensoftware-br.com>
Date: Thu, 26 May 2011 18:50:43 -0300
Subject: [Buildroot] How to generete initramfs inside kernel img.
Message-ID: <4DDECB33.6070402@opensoftware-br.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am using buildroot-2011-02, without a problem, the tools is the best 
one, because I tryied a several others.

I want to generate initramfs inside the kernel image, but I searched how 
to do that, and the unique information found, is the setup of initramfs 
into the kernel's config file, but buildroot always generate it in a 
separate file.

I got a kernel image with initramfs inside it, but using another 
method,I downloaded kernel sources, patched it, configured it and 
compiled it, but I want to use buildroot for all steps, bootstrap, 
u-boot and kernel.

Best regards.

Paulo
