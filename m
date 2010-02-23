From: Roo <roo.watt@gmail.com>
Date: Wed, 24 Feb 2010 10:30:53 +1100
Subject: [Buildroot] Newbie: AT91SAM9260 NAND Boot
In-Reply-To: <D3796D57A9CF4CBE9A4A46D52BE466DE@apexjs>
References: <D3796D57A9CF4CBE9A4A46D52BE466DE@apexjs>
Message-ID: <815f0bd71002231530v3f7eeca9g23c1849996ff1b28@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24 February 2010 08:22, Sagaert Johan <sagaert.johan@skynet.be> wrote:

> i use UBIFS on the nandflash : it seems to be the best choice
>
> once booted from nfs (for my board )

Thanks for the quick run down, that will be very helpful. I have done
some reading about file system and comparisons, it seemed the
conclusion was that jffs2 might be better under powercuts. Do you
think this is the case.

The current plan is to mount the rootfs read only (or use a read only
fs) and use a tmpfs for /var/{log,run} etc. The application uses an
embedded database and it seems we will need to place that on a sd card
due to its size.

Thanks for you help, it's really appreciated.

Cameron.
