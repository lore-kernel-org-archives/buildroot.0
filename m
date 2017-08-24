From: Aseem Sharma <aseem.sharma19@gmail.com>
Date: Thu, 24 Aug 2017 07:13:55 +0530
Subject: [Buildroot] Need help with "CONFIG_CMDLINE" or setting up serial
	console.
In-Reply-To: <CANK3ZEeRTwNokPC8WS1VXiViQqmt6=Dpo3f_-_metsKQM3AjFg@mail.gmail.com>
References: <CANK3ZEcnN1bK_LkiN-WGBcOqeRJhyPWwFjdDvAUQMefRp5QDew@mail.gmail.com>
 <CANK3ZEeshYV1gRVEdJwFv-qJ7FW3bBS3p0Uv64EGgtiqBu=+DQ@mail.gmail.com>
 <CANK3ZEcxuKgGCJeMxPQG6DytubWuojBieb+ApJiaW3rOrMbWzw@mail.gmail.com>
 <CANK3ZEfboeXLiyTZs0nR_CnmOp_VOsKdZxfo_0ocUbumEr_kkA@mail.gmail.com>
 <CANK3ZEdDRfwMSXKHHxKSHbzzxzfr1Z4dgL8eTKZSYHdKgGdjCA@mail.gmail.com>
 <CANK3ZEcNN4dS1mhsWCPQmc1RaUrVacErJ0eeVG_rEYcoMWER+g@mail.gmail.com>
 <CANK3ZEe8-g11nW4xsjnO8f1YX7sxOaEiVrvcTNdg3uCudgOQbw@mail.gmail.com>
 <CANK3ZEfgerodJDfKZr0QOfo1SuSeMFGR+fqthi=u4urN-T7sPQ@mail.gmail.com>
 <CANK3ZEeRTwNokPC8WS1VXiViQqmt6=Dpo3f_-_metsKQM3AjFg@mail.gmail.com>
Message-ID: <CANK3ZEdib88=wt7YLnhBj2XwNJA8E3eZdecN3F_SgCO8Tbv=xw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have created rootfs and zImage for "arm926t" using the long term support
release of buildroot. However I am having trouble knowing if it is working
as I do not see any messages on the screen.

How do I setup serial console on my device? I am not able to find the usual
"CONFIG_CMDLINE" option in menuconfig to be able to set kernel command line.

It will be really helpful if you can help me with the procedure/workaround
to be able to give command line parameter to the kernel. Or any other means
to redirect the output to ttyS0.

Thanks & Regards,
Aseem
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170824/28ab8cc8/attachment.html>
