From: Andreas Ziegler <br015@umbiko.net>
Date: Sat, 23 Jan 2021 07:46:02 +0000
Subject: [Buildroot] RV32 "initial RAM FS linked into the target"
In-Reply-To: <mailman.11648.1611353096.95883.buildroot@busybox.net>
References: <mailman.11648.1611353096.95883.buildroot@busybox.net>
Message-ID: <daf223465567a2563c4038713d3213b6@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guy,

> Date: Fri, 22 Jan 2021 16:23:58 -0500
> Message-ID:
> 	<CAEYXRPnWD3VZTwuMNnk6zk76xnhEy8imJEe-iXgpcT3B8Hkivw@mail.gmail.com>

> Is my assumption correct? If yes is there any specific parameter that I
> should pass to the Kernel for this to work?

Check that your kernel config has CONFIG_BLK_DEV_INITRD enabled and 
point it to the rootfs.cpio in the images directory.

Kind regards,
Andreas
