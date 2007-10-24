From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Wed, 24 Oct 2007 21:34:50 +0300
Subject: [Buildroot] Dataflash rootfs problems (still)
In-Reply-To: <6090c5eb0710240954q368b3409k282c02a5e2fcbef4@mail.gmail.com>
References: <6090c5eb0710240920o4e56f66et2c9f1761c97aea4e@mail.gmail.com>	<1193243618.4415.6.camel@aeglos.sweden.atmel.com>
	<6090c5eb0710240954q368b3409k282c02a5e2fcbef4@mail.gmail.com>
Message-ID: <471F904A.5050206@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> During the 1st boot, Dropbear creates and "writes" the generated keys, maybe
> is this *write* operation the one screwing up the dataflash?
> 

We have similar problems with Dataflash&RM9200
*write* operation is unreliable - we had corrupted filesystem after reboot.
Our solution was to use r/o only on dataflash.


Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
