From: David Laight <David.Laight@ACULAB.COM>
Date: Mon, 17 May 2021 09:30:21 +0000
Subject: [Buildroot] BR2_PACKAGE_BUSYBOX_CONFIG ignored
In-Reply-To: <875yzlthjq.fsf@dell.be.48ers.dk>
References: <1620983462705-0.post@n4.nabble.com>
 <87a6oxtl7d.fsf@dell.be.48ers.dk>
 <b68fa0a4d3734a67bef3497336d7620b@AcuMS.aculab.com>
 <875yzlthjq.fsf@dell.be.48ers.dk>
Message-ID: <f7d98c60f3fa418e81a74b0a9d15d26c@AcuMS.aculab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Korsgaard
> Sent: 14 May 2021 17:19
...
> We already have 'make busybox-update-config' for that:
> 
> make busybox-update-config
> cp -f /home/peko/source/buildroot/output-busybox/build/busybox-1.33.0/.config /tmp/config

Ah, I was expecting the files to be copied both ways all the time.
I don't remember spotting that target in the documentation.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
