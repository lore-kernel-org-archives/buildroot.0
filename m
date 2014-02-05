From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 5 Feb 2014 10:35:02 +0100
Subject: [Buildroot] Kernel image format :  kernel image is not rebuild
Message-ID: <39AACAAA6258427B9662537ABA591922@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
 Hi

If i change the kernel image format from zImage to uImage buildroot does not make the uImage.
If only does it if I remove the stamps in the target kernel so buildroot is forced to recompile the kernel.
Then it generates the uImage.
Likewise if I change it to uImage with appended DTB, I must first force the kernel to be rebuild.



Regards , Johan
