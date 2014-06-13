From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 13 Jun 2014 17:42:43 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: add network unit file
In-Reply-To: <20140611223447.1d5e7a65@free-electrons.com>
References: <CAPyrzo0q7Y3Tf1LOaCe4LK78a7sZrVdToLfnzp4Tc4kow=-nKA@mail.gmail.com>
 <1390874097-25597-1-git-send-email-vsergeev@kumunetworks.com>
 <20140611223447.1d5e7a65@free-electrons.com>
Message-ID: <20140613154242.GB15237@rmm-p1267483>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Ivan,

On Wed, Jun 11, 2014 at 10:34:47PM +0200, Thomas Petazzoni wrote:
> Eric,
>
> As our systemd person, could you have a look at this patch, and give
> your comments and/or Acked-by/Reviewed-by as appropriate?
>
I've tested the patch. It is OK, but I made some modifications:

- rebase
- the new network.service is not installed if systemd-networkd is selected, as
  they conflict.

The updated version can be found at http://patchwork.ozlabs.org/patch/359561/.

Best regards,
ELB
