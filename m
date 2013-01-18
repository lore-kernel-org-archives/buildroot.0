From: Stephan Hoffmann <sho@relinux.de>
Date: Fri, 18 Jan 2013 09:14:25 +0100
Subject: [Buildroot] New kernel source mode [Proposal]
In-Reply-To: <EE5E77B503DE9A478B63A89AAD2585EDB66A39@vpane.excalyptech.com>
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A2F@vpane.excalyptech.com>
 <50F50A74.8000501@relinux.de>
 <EE5E77B503DE9A478B63A89AAD2585EDB66A39@vpane.excalyptech.com>
Message-ID: <50F90461.3020206@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 18.01.2013 02:10, schrieb Przemyslaw Wrzos:
> Hi Stephen,
>
> Just an update to the patch I sent in yesterday. Between trying to get
> both the generic and non-generic versions working I seem to have
> introduced a bug at some point into my proposed patch for the linux
> kernel. I'm including an updated version for you to look at (just a
> missing line that caused the download step to try to download a
> nonsensical non-existent file).
Hello Przemyslaw,

I think I don't have the time to try it out before next week.

Regards

Stephan
>
> One other thing I should note about the patch which I didn't elaborate
> on yesterday. After digging around in the linux source code there
> doesn't seem to be a way to perform the buildroot_defconfig make step in
> an out of tree build so I had to settle for simply copying the
> configuration file across.
>
> Cheers,
> Przemyslaw Wrzos
