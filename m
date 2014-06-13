From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jun 2014 17:44:09 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: add network unit file
In-Reply-To: <20140613154242.GB15237@rmm-p1267483>
References: <CAPyrzo0q7Y3Tf1LOaCe4LK78a7sZrVdToLfnzp4Tc4kow=-nKA@mail.gmail.com>
 <1390874097-25597-1-git-send-email-vsergeev@kumunetworks.com>
 <20140611223447.1d5e7a65@free-electrons.com>
 <20140613154242.GB15237@rmm-p1267483>
Message-ID: <20140613174409.351c8b0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Fri, 13 Jun 2014 17:42:43 +0200, Eric Le Bihan wrote:

> I've tested the patch. It is OK, but I made some modifications:
> 
> - rebase
> - the new network.service is not installed if systemd-networkd is selected, as
>   they conflict.
> 
> The updated version can be found at http://patchwork.ozlabs.org/patch/359561/.

Thanks, I've marked Ivan's patch as superseded in patchwork.

Thanks a lot for working on this!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
